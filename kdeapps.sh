#!/bin/bash

sudo pacman -S --no-confirm ark dolphin dolphin-plugins elisa ffmpegthumbs filelight \
  gwenview kate kcalc kdeconnect kdegraphics-thumbnailers kdialog kfind \
  khelpcenter konsole krdc ksystemlog ktorrent kwalletmanager okular \
  partitionmanager print-manager yakuake openssh ufw pipewire pipewire-alsa \
  pipewire-pulse xf86-video-intel plasma-meta sddm gnu-free-fonts noto-fonts \
  ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid ttf-ibm-plex ttf-liberation \
  phonon-qt5-vlc git zsh deja-dup flatpak firefox vivaldi vivaldi-ffmpeg-codecs \
  vlc stow xdg-user-dirs xdg-utils stow cups neovim nodejs npm ruby rubygems \
  python-pip

# Install paru and aur packages
git clone https://aur.archlinux.org/paru-bin ~/paru-bin
cd paru-bin
makepkg -si

cd ~

rm -rf ~/paru-bin

paru -Syy

paru -S nerd-fonts-jetbrains-mono visual-studio-code-bin python-neovim

# Deploy Dot Files
git clone https://github.com/shadkaske/arch-dots ~/.dots
cd ~/.dots
git submodule update
bash ./deploy.sh

# Grab neovim config
git clone https://github.com/shadkaske/neovim-coc ~/.config/nvim

# Set SDDM Theme
sudo tee /usr/lib/sddm/sddm.conf.d/settheme.conf > /dev/null <<'TXT'
[Theme]
ThemeDir=/usr/share/sddm/themes
Current=breeze
TXT


# Configure NPM Prefix
mkdir ~/.npm-global
npm config set prefix ~/.npm-global

npm install -g neovim

# Install bizmuth kwin tiling script
wget -q -O - https://git.io/J2gLk | sh

# Install flatpaks
flatpak install flathub io.dbeaver.DBeaverCommunity com.bitwarden.desktop
