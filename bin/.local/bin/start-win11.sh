#!/usr/bin/env bash

# Check if running

running=$(virsh list | grep Windows11)

if [[ -z $running ]]; then
	virsh start Windows11 >/dev/null
fi

virt-viewer --connect=qemu:///system --domain-name Windows11
