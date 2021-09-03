#!/bin/bash

host_name="nw-workstation01"

# Set Time Zone
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

# Set Hardware Clock
hwclock --systohc

# Generate Locale Data
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

# Set Console Locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set Host Name
echo "$host_name" > /etc/hostname

# Populate Hosts File
cat > /etc/hosts << EOL
# Static table lookup for hostnames.
# See hosts(5) for details.
127.0.0.1	localhost
::1		    localhost
127.0.0.1	${host_name}.showplacewood.com ${host_name}
EOL

# Install Basics

# Make initfs
mkinitcpio -P

# Enable basic services
systemctl enable NetworkManager
systemctl enable lightdm

# Install Grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi/ --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

# Add User and set Passwords
useradd -G wheel,users,video,power -U -m shad
echo "Set Root User Password: "
passwd
echo "Set User Password: "
passwd shad

# Set wheel group to do sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/99_wheel
