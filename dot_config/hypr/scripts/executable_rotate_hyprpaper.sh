#!/usr/bin/env bash

BG_DIR="$HOME/.local/share/backgrounds"
MY_MONITORS=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
ROTATE_TIME="${HYPRPAPER_ROTATE_TIME:=15m}"

while true; do
  RANDOM_JPG=$(ls $BG_DIR/*.jpg | shuf -n 1)

  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$RANDOM_JPG"

  for m in "${MY_MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$m, $RANDOM_JPG"
  done

  # Convert the Random Jpg to Background for lock screen
  magick "$RANDOM_JPG" "$HOME/.local/share/lock_bg.png"

  sleep "$ROTATE_TIME"
done
