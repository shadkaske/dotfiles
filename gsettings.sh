#!/usr/bin/env bash

gsettings set org.gnome.mutter center-new-windows true

gsettings set org.gnome.desktop.interface enable-hot-corners false

gsettings set org.gnome.mutter dynamic-workspaces false

gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

for i in {1..9}; do
    gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
    gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Shift><Super>$i']"
    gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']"
done

# DD Term Config
dconf write /com/github/amezin/ddterm/tab-policy "'never'"
dconf write /com/github/amezin/ddterm/notebook-border false
dconf write /com/github/amezin/ddterm/audible-bell false
dconf write /com/github/amezin/ddterm/show-scrollbar false
dconf write /com/github/amezin/ddterm/panel-icon-type "'none'"
dconf write /com/github/amezin/ddterm/window-size 0.30

# Titling Assistant
dconf write /org/gnome/shell/extensions/tiling-assistant/single-screen-gap 10
dconf write /org/gnome/shell/extensions/tiling-assistant/window-gap 10
dconf write /org/gnome/shell/extensions/tiling-assistant/maximize-with-gap true

# Set default mono space font
dconf write /org/gnome/desktop/interface/monospace-font-name "'SauceCodePro Nerd Font Mono 16'"

# Gnome Terminal
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -
dconf write /org/gnome/terminal/legacy/profiles:/default "'5083e06b-024e-46be-9cd2-892b814f1fc8'"

# Keymaps
dconf write /org/gnome/desktop/wm/keybindings/close "['<Super>q']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Kitty'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'kitty'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>Return'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/home "['<Super>e']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/calculator "['<Super>equal']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/www "['<Super>w']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "['<Super>Escape']"
dconf write /org/gnome/shell/app-switcher/current-workspace-only true
dconf write /org/gnome/settings-daemon/plugins/media-keys/control-center "['<Super>comma']"
