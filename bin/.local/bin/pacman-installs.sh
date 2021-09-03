sudo pacman -Syy

sudo pacman -S archlinux-wallpaper thunar-archive-plugin thunar thunar-volman \
    mpd mpc yarn xclip ranger ruby python-pip neovim python-pip npm \
    nodejs ruby rubygems libvirt qemu edk2-ovmf ebtables dnsmasq bridge-utils \
    virt-manager samba ttf-font-awesome gnupg nfs nfs-utils reflector fd jq \
    cmake nextcloud-client unclutter udisks2 udiskie gvfs-smb openssh ufw \
    ufw-extras pavucontrol dnsutils isync duplicity deja-dup xdotool engrampa \
    firefox xournalpp evince poppler wget cronie vagrant virt-viewer evince \
    xfce4-screenshooter bc libreoffice-still mlocate texlive-core \
    texlive-fontsextra texlive-formatsextra emacs network-manager-applet tmux \
    wine-staging winetricks wine-mono wine-gecko grub-theme-vimix msmtp mpd \
    ncmpcpp ripgrep the_silver_searcher texlive-latexextra xfce4-screensaver \
    lxpolkit deja-dup duplicity awesome xorg lightdm lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings networkmanager grub efibootmgr qutebrowser \
    feh bash-completion terminus-font remmina freerdp kitty kvantum-qt5 \
    kvantum-theme-materia gnu-free-fonts noto-fonts ttf-bitstream-vera \
    arandr docker docker-compose lxsession neofetch volumeicon papirus-icon-theme \
    pdfjs ttf-croscore ttf-ibm-plex ttf-liberation xfce4-power-manager zsh \
    xdg-utils xdg-user-dirs git reflector

git clone https://aur.archlinux.org/yay-bin

cd yay-bin

makepkg -si

rm -rf yay-bin

yay -Syy

yay -S nerd-fonts-jetbrains-mono rofi-dmenu rofi-greenclip picom-jonaburg-git \
    lazygit xcursor-breeze tmuxinator iacs google-chrome mu \
    visual-studio-code-bin teams-for-linux dbeaver ipscan bitwarden-rofi-git \
    lastpass-cli zoom gitflow-avh postman-bin nordic-theme lain-git alacritty-ligatures \

