#! /usr/bin/env bash

virt_list=$(virsh list --all --table | tail -n +3 | awk -F ' ' '{print $2}' | grep "\S")

net_list=$(virsh net-list --all | tail -n +3 | awk -F ' ' '{print $1}' | grep "\S")

backup_dir=$(pwd)

# Dump Network Configs
while IFS= read -r net; do
  echo "Exporting Network: $net ..."
  virsh net-dumpxml "$net" >"$backup_dir/network/$net.xml"
done <<<"$net_list"

while IFS= read -r domain; do
  echo "Processing: $domain ..."
  virsh dumpxml "$domain" >"$backup_dir/machines/$domain.xml"

  # Dump Snapshots
  snapshot_list=$(virsh snapshot-list --domain "$domain" | tail -n +3 | awk -F ' ' '{print $1}' | grep "\S")

  while IFS= read -r snapshot; do
    if [[ -n "$snapshot" ]]; then
      echo "Exporting Snapshot: $snapshot for $domain"
      virsh snapshot-dumpxml "$domain" "$snapshot" >"$backup_dir/snapshots/$domain_$snapshot.xml"
    fi
  done <<<"$snapshot_list"
done <<<"$virt_list"

# Rsync Disk Images
echo "Copying image files ..."
sudo rsync -avz /var/lib/libvirt/images/ "$backup_dir/images/"
