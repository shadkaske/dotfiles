export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland exec Hyprland
fi

if [[ -z $DISPLAY && $(tty) == /dev/tty2 && $XDG_SESSION_TYPE == tty ]]; then
  MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
fi
