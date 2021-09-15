#!/bin/bash
picom --config ~/.config/picom/picom.conf &
nm-applet &
autokey-gtk &
greenclip daemon &
unclutter -root &
lxpolkit &
udevadm monitor &
nextcloud --background &
udiskie &
xfce4-power-manager --sm-client-disable &
xfce4-screensaver &
feh --bg-fill --randomize ~/.local/share/backgrounds/* &