#!/usr/bin/env bash
# exit immediately if password-manager-binary is already in $PATH
type bw >/dev/null 2>&1 && exit

source /etc/os-release

if [ "$ID" == "fedora" ]; then
  sudo dnf install --assumeyes nodejs npm
  sudo npm -g install @bitwarden/cli
elif [ "$ID" == "arch" ]; then
  sudo pacman -S --noconfirm bitwarden-cli
fi
