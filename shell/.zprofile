export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24
export WLR_NO_HARDWARE_CURSORS=1
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   exec Hyprland
fi

if [[ -z $DISPLAY && $(tty) == /dev/tty2 && $XDG_SESSION_TYPE == tty ]]; then
  exec dbus-run-session gnome-session
fi
