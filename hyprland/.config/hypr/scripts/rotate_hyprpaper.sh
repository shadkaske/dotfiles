#!/bin/bash

BG_DIR="$HOME/.local/share/backgrounds"
MY_MONITOR=`hyprctl monitors | grep Monitor | awk '{print $2}'`
ROTATE_TIME="${HYPRPAPER_ROTATE_TIME:=15m}"

while true; do
    RANDOM_JPG=$(ls $BG_DIR/*.jpg | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$RANDOM_JPG"
    hyprctl hyprpaper wallpaper "$MY_MONITOR, $RANDOM_JPG"

    # Convert the Random Jpg to Background for lock screen
    convert "$RANDOM_JPG" "$HOME/.local/share/lock_bg.png"

    sleep "$ROTATE_TIME"
done
