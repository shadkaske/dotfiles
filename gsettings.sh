#!/bin/bash
# Set Static Workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
gsettings set org.gnome.desktop.wm.keybindings toggle-on-all-workspaces "['<Super>0']"

for i in {1..9}
do
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

# Set default Monitor Keybind
gsettings set org.gnome.mutter.keybindings switch-monitor '[<Super><Shift>p]'
