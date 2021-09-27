#!/bin/bash
if command -v xdg-user-dirs-update &>/dev/null
then
    sudo pacman -S --noconfirm xdg-user-dirs xdg-utils
fi

xdg-user-dirs-update

# Ensure a few directories exist
[ ! -d $HOME/.local/bin ] && mkdir -p $HOME/.local/bin

[ ! -d $HOME/.local/share/applications ] && mkdir -p $HOME/.local/share/applications

[ ! -d $HOME/.local/share/backgrounds ] && mkdir -p $HOME/.local/share/backgrounds

if ! command -v stow &>/dev/null
then
  sudo pacman -S --noconfirm stow
fi

find -maxdepth 1 -path './[^.]*' -type d -printf '%f\n' | xargs stow

# Clone git repos and setup some basic shell bit

# Make sure oh-my-zsh is installed
[ ! -d $HOME/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.oh-my-zsh

# Make sure fzf is installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    $HOME/.fzf/install --no-fish --all

# Check if the PowerLevel10k Plugin is install
[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Check if the Autosuggestions Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Check if the Syntax Highlight Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Clone Kitty color schemes
[ ! -d $HOME/.config/kitty/kitty-themes ] && git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

# Install Ranger Devicons
[ ! -d $HOME/.config/ranger/plugins/ranger_devicons ] && git clone https://github.com/alexanderjeurissen/ranger_devicons \
    $HOME/.config/ranger/plugins/ranger_devicons
