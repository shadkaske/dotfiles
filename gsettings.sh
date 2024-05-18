#!/usr/bin/env bash
# Install Extensions
EXTENSIONS_ADDED=0
SHELL_EXTENSION_HOME="$HOME/.local/share/gnome-shell/extensions"

gnome-extensions enable forge@jmmaranan.com
gnome-extensions enable no-overview@fthx
gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com

# App Indicators
if [[ ! -d "$SHELL_EXTENSION_HOME/appindicatorsupport@rgcjonas.gmail.com" ]]; then
	git clone https://github.com/ubuntu/gnome-shell-extension-appindicator.git
	meson gnome-shell-extension-appindicator /tmp/g-s-appindicators-build
	ninja -C /tmp/g-s-appindicators-build install
	gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
	EXTENSIONS_ADDED=1
fi

# Clipboard history
if [[ ! -d "$SHELL_EXTENSION_HOME/clipboard-history@alexsaveau.dev" ]]; then
	git clone https://github.com/SUPERCILEX/gnome-clipboard-history.git "$SHELL_EXTENSION_HOME/clipboard-history@alexsaveau.dev"
	popd "$SHELL_EXTENSION_HOME/clipboard-history@alexsaveau.dev"
	make
	gnome-extensions enable clipboard-history@alexsaveau.dev
	EXTENSIONS_ADDED=1
fi

# ddterm
if [[ ! -d "$SHELL_EXTENSION_HOME/ddterm@amezin.github.com" ]]; then
	version_number=$(curl --silent "https://api.github.com/repos/ddterm/gnome-shell-extension-ddterm/releases/latest" | jq -r .tag_name)
	popd /tmp
	wget https://github.com/ddterm/gnome-shell-extension-ddterm/releases/download/$version_number/ddterm@amezin.github.com.shell-extension.zip
	gnome-extensions install -f /tmp/ddterm@amezin.github.com.shell-extension.zip
	gnome-extensions enable ddterm@amezin.github.com
	EXTENSIONS_ADDED=1
fi

# Go to Last Workspace
if [[ ! -d "$SHELL_EXTENSION_HOME/gnome-shell-go-to-last-workspace@github.com" ]]; then
	git clone https://github.com/arjan/gnome-shell-go-to-last-workspace /tmp/last-workspace
	popd /tmp/last-workspace
	make install
	gnome-extensions enable gnome-shell-go-to-last-workspace@github.com
	EXTENSIONS_ADDED=1
fi

# Remmina Search Provider
if [[ ! -d "$SHELL_EXTENSION_HOME/remmina-search-provider@alexmurray.github.com" ]]; then
	git clone https://github.com/alexmurray/remmina-search-provider.git /tmp/remmina-search-provider
	popd /tmp/remmina-search-provider
	make
	rspversion=$(jq .version metadata.json -r)
	gnome-extensions install -f "./remmina-search-provider@alexmurray.github.com-$rspversion.zip"
	gnome-extensions enable remmina-search-provider@alexmurray.github.com
	EXTENSIONS_ADDED=1
fi

# ssh search provider
if [[ ! -d "$SHELL_EXTENSION_HOME/ssh-search-provider@extensions.gnome-shell.fifi.org" ]]; then
	sshsversion=$(curl --silent "https://api.github.com/repos/F-i-f/ssh-search-provider/releases/latest" | jq -r .tag_name)
	popd /tmp
	wget "https://github.com/F-i-f/ssh-search-provider/releases/download/$sshsversion/ssh-search-provider@extensions.gnome-shell.fifi.org.$sshsversion.shell-extension.zip"
	gnome-extensions install -f "/tmp/ssh-search-provider@extensions.gnome-shell.fifi.org.$sshsversion.shell-extension.zip"
	gnome-extensions enable ssh-search-provider@extensions.gnome-shell.fifi.org
	EXTENSIONS_ADDED=1
fi

gsettings set org.gnome.desktop.interface color-scheme "'prefer-dark'"

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'

gsettings set org.gnome.mutter center-new-windows true

gsettings set org.gnome.desktop.interface enable-hot-corners false

gsettings set org.gnome.mutter dynamic-workspaces false

gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

for i in {1..9}; do
	gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
	gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Shift><Super>$i']"
	gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']"
done

# Set default mono space font
dconf write /org/gnome/desktop/interface/monospace-font-name "'JetBrainsMono Nerd Font Thin 14'"

# Gnome Terminal
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 - 1>/dev/null
dconf write /org/gnome/terminal/legacy/profiles:/default "'5083e06b-024e-46be-9cd2-892b814f1fc8'"
dconf write /org/gnome/terminal/legacy/profiles:/:5083e06b-024e-46be-9cd2-892b814f1fc8/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:5083e06b-024e-46be-9cd2-892b814f1fc8/cursor-shape "'underline'"
dconf write /org/gnome/terminal/legacy/profiles:/:5083e06b-024e-46be-9cd2-892b814f1fc8/scrollbar-policy "'never'"
dconf write /org/gnome/terminal/legacy/profiles:/:5083e06b-024e-46be-9cd2-892b814f1fc8/use-custom-command false

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

if $EXTENSIONS_ADDED -gt 0; then
	echo "Extensions Installed logout and login. Rerun to configure newly added extensions"
	exit 0
else
	# DD Term Config
	dconf write /com/github/amezin/ddterm/tab-policy "'never'"
	dconf write /com/github/amezin/ddterm/notebook-border false
	dconf write /com/github/amezin/ddterm/audible-bell false
	dconf write /com/github/amezin/ddterm/show-scrollbar false
	dconf write /com/github/amezin/ddterm/panel-icon-type "'none'"
	dconf write /com/github/amezin/ddterm/window-size 0.30

	# Go To Last Workspace
	dconf write /org/gnome/shell/extensions/go-to-last-workspace/shortcut-key "['<Super>apostrophe']"
fi
