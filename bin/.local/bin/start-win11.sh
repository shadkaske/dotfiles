#!/usr/bin/env bash

# Check if running

running=$(virsh list | grep win11)

if [[ -z $running ]]; then
  virsh start win11 >/dev/null
fi

virt-viewer --connect=qemu:///system --domain-name win11
