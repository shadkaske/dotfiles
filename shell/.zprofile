if [[ "$(tty)" == "/dev/tty1" ]];
then
    exec /usr/bin/Hyprland
fi

if [[ "$(tty)" == "/dev/tty2" ]];
then
    exec /usr/bin/startplasma-wayland
fi
