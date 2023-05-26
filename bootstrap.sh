#! /bin/bash

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
