#!/bin/bash
if ! command -v stow &>/dev/null
then 
  sudo pacman -S --noconfirm stow
fi

find -maxdepth 1 -path './[^.]*' -type d -printf '%f\n' | xargs stow
