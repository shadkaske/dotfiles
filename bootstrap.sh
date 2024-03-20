#! /usr/bin/env bash

set -x

declare -a configs=(
    awesome
    bat
    bin
    fd
    gamemode
    git
    greenclip
    ideavim
    kitty
    lazygit
    mpd
    mpdris2
    mycli
    ncmpcpp
    picom
    ranger
    rofi
    share
    shell
    systemd
    tmux
    wezterm
    X
)

for item in "${configs[@]}"; do
    stow -t "$HOME" -v "$item"
done

OS_NAME=$( (lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1 | tr -d '"')
case "$OS_NAME" in
    "Arch Linux")
        export OS_PLUGIN=archlinux
        sudo pacman --needed -S eza bat zoxide fd ripgrep ranger stow
    ;;
    *)
        export OS_PLUGIN=ubuntu
        curl https://sh.rustup.rs -sSf | sh
        if [ -f "$HOME/.cargo/env" ]; then
            source "$HOME/.cargo/env"
        fi

        "$HOME/.cargo/bin/install" eza bat zoxide fd-find ripgrep
        sudo apt-get --yes install ranger stow
    ;;
esac

# Install fzf
if [ ! -d "$HOME/.fzf" ]
then
    git clone https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install --bin"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.local/share/oh-my-zsh" ];
then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.local/share/oh-my-zsh/"
fi

# Ensure zsh custom is available
THEMES_DIR="$HOME/.local/share/zsh-custom/themes"
PLUGIN_DIR="$HOME/.local/share/zsh-custom/plugins"
mkdir -p "$THEMES_DIR"
mkdir -p "$PLUGIN_DIR"

# Install PowerLevel10k
if [ ! -d "$THEMES_DIR/powerlevel10k" ];
then
    git clone https://github.com/romkatv/powerlevel10k "$THEMES_DIR/powerlevel10k"
fi

# Install Artisan Plugin
if [ ! -d "$PLUGIN_DIR/artisan" ];
then
    git clone https://github.com/jessarcher/zsh-artisan.git "$PLUGIN_DIR"/artisan
fi

# Install Eza Plugin
if [ ! -d "$PLUGIN_DIR/zsh-eza" ];
then
    git clone https://github.com/z-shell/zsh-eza "$PLUGIN_DIR/zsh-eza"
fi

#  Install  fast syntax highlighting
if [ ! -d "$PLUGIN_DIR/fast-syntax-highlighting" ];
then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$PLUGIN_DIR/fast-syntax-highlighting"
fi

# Install autosuggestions
if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ];
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

# Install bat plugin
if [ ! -d "$PLUGIN_DIR/zsh-bat" ];
then
    git clone https://github.com/fdellwing/zsh-bat "$PLUGIN_DIR/zsh-bat"
fi

# Install Zsh Vi Mode Plugin
if [ ! -d "$PLUGIN_DIR/zsh-vi-mode" ];
then
    git clone https://github.com/jeffreytse/zsh-vi-mode "$PLUGIN_DIR/zsh-vi-mode"
fi

# Install Zsh Autoswitch VirtualEnv
if [ ! -d "$PLUGIN_DIR/autoswitch_virtualenv" ];
then
    git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv "$PLUGIN_DIR/autoswitch_virtualenv"
fi

# Install Zsh Sail Plugin
if [ ! -d "$PLUGIN_DIR/laravel-sail" ];
then
    git clone https://github.com/marcandreappel/sail "$PLUGIN_DIR/sail"
fi

# Install Ranger Plugins
if [ ! -d "$HOME/.config/ranger/plugins/ranger_devicons" ];
then
	CONFIGPATH="$HOME/.config/ranger/plugins/ranger_devicons"
	REPOURL="https://github.com/alexanderjeurissen/ranger_devicons"

    git clone "$REPOURL" "$CONFIGPATH"
fi

