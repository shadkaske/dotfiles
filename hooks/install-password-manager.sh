#!/usr/bin/env bash
# exit immediately if password-manager-binary is already in $PATH
type rbw >/dev/null 2>&1 && exit

source /etc/os-release

if [ "$ID" == "fedora" ]; then
  sudo dnf install --assumeyes rbw
elif [ "$ID" == "arch" ]; then
  sudo pacman -S --noconfirm rbw
fi
