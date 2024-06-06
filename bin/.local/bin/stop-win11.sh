#!/usr/bin/env bash

# Check if running

running=$(virsh list | grep Windows11)

if [[ ! -z $running ]]; then
	virsh shutdown Windows11 >/dev/null
fi
