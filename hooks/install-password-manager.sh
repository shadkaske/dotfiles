#!/usr/bin/env bash

bw_login() {
  if [ "$ID" == "fedora" ]; then
    sudo dnf install --assumeyes jq
  elif [ "$ID" == "arch" ]; then
    sudo pacman -S --noconfirm jq
  fi

  BW_STATUS="$(bw status | jq -r '.status')"

  if [[ "$BW_STATUS" == "unauthenticated" ]]; then
    echo "Login to Bitwarden: "
    bw login
  fi
}

# exit immediately if password-manager-binary is already in $PATH
if type bw >/dev/null 2>&1; then
  bw_login
  exit
fi

source /etc/os-release

if [ "$ID" == "fedora" ]; then
  sudo dnf install --assumeyes nodejs npm jq
  sudo npm -g install @bitwarden/cli
elif [ "$ID" == "arch" ]; then
  sudo pacman -S --noconfirm bitwarden-cli jq
fi

bw_login
