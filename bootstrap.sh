#! /bin/bash

set -x

OS_NAME=$((lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1 | tr -d '"')
case "$OS_NAME" in
    "Arch Linux")
        export OS_PLUGIN=archlinux
        sudo pacman --needed -S eza bat zoxide fd ripgrep ranger stow
    ;;
    *)
        export OS_PLUGIN=ubuntu
        curl https://sh.rustup.rs -sSf | sh
        source "$HOME/.cargo/env"
        "$HOME/.cargo/bin/install" eza bat zoxide fd-find ripgrep
        sudo apt-get --yes install ranger stow
    ;;
esac

# Install fzf
if [ ! -d "$HOME/.fzf" ]
then
    git clone https://github.com/junegunn/fzf.git "$HOME/.fzf"
    $HOME/.fzf/install --bin
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

if [ ! -d "$PLUGIN_DIR/zsh-eza" ];
then
    git clone https://github.com/z-shell/zsh-eza "$PLUGIN_DIR/zsh-eza"
fi

if [ ! -d "$PLUGIN_DIR/fast-syntax-highlighting" ];
then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$PLUGIN_DIR/fast-syntax-highlighting"
fi

if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ];
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

if [ ! -d "$PLUGIN_DIR/zsh-bat" ];
then
    git clone https://github.com/fdellwing/zsh-bat "$PLUGIN_DIR/zsh-bat"
fi

if [ ! -d "$HOME/.config/ranger/plugins/ranger_devicons" ];
then
	CONFIGPATH="$HOME/.config/ranger/plugins/ranger_devicons"
	REPOURL="https://github.com/alexanderjeurissen/ranger_devicons"

    git clone $REPOURL $CONFIGPATH
fi

# Kitty
# if [ ! -d "$HOME/.config/kitty/kitty-themes" ];
# then
# 	CONFIGPATH="$HOME/.config/kitty/kitty-themes"
# 	REPOURL="https://github.com/dexpota/kitty-themes.git"
#
#     git clone $REPOURL $CONFIGPATH
# fi

# Awesome
# if [ -d "$HOME/.config/awesome/lain" ];
# then
# 	CONFIGPATH="awesome/.config/awesome/lain"
# 	REPOURL="https://github.com/lcpz/lain.git"
#
#     git clone $REPOURL $CONFIGPATH
# fi

# [submodule "tmux/.tmux/plugins/tpm"]
# 	CONFIGPATH=tmux/.tmux/plugins/tpm
# 	REPOURL=https://github.com/tmux-plugins/tpm
# [submodule "tmux/.tmux/plugins/tmux-sensible"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-sensible
# 	REPOURL=https://github.com/tmux-plugins/tmux-sensible.git
# [submodule "tmux/.tmux/plugins/tmux-onedark-theme"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-onedark-theme
# 	REPOURL=https://github.com/odedlaz/tmux-onedark-theme.git
# [submodule "tmux/.tmux/plugins/tmux-resurrect"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-resurrect
# 	REPOURL=https://github.com/tmux-plugins/tmux-resurrect
# [submodule "tmux/.tmux/plugins/tmux-continuum"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-continuum
# 	REPOURL=https://github.com/tmux-plugins/tmux-continuum
# [submodule "tmux/.tmux/plugins/tmux-yank"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-yank
# 	REPOURL=https://github.com/tmux-plugins/tmux-yank
# [submodule "tmux/.tmux/plugins/vim-tmux-navigator"]
# 	CONFIGPATH=tmux/.tmux/plugins/vim-tmux-navigator
# 	REPOURL=https://github.com/christoomey/vim-tmux-navigator
# [submodule "tmux/.tmux/plugins/tmux-tilish"]
# 	CONFIGPATH=tmux/.tmux/plugins/tmux-tilish
# 	REPOURL=https://github.com/jabirali/tmux-tilish
# [submodule "tmux/.tmux/plugins/tokyo-night-tmux"]
# 	CONFIGPATH=tmux/.tmux/plugins/tokyo-night-tmux
# 	REPOURL=https://github.com/shadkaske/tokyo-night-tmux
