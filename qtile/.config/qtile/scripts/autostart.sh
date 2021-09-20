#!/bin/bash
picom --config ~/.config/qtile/scripts/picom.conf &
nm-applet &
volumeicon &
pia-client &
greenclip daemon &
unclutter -root &
lxpolkit &
udevadm monitor &
nextcloud --background &
udiskie &
xfce4-power-manager --sm-client-disable &
xfce4-screensaver &
feh --bg-fill --randomize ~/.local/share/backgrounds/* &
sxhkd &
