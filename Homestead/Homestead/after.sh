#!/bin/sh


# Add MSSQL Driver
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list -o /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update

sudo ACCEPT_EULA=Y apt-get install --yes msodbcsql18 unixodbc

sudo apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install ripgrep tmux git-flow

sudo dpkg -i $HOME/printapp/vagrant-files/ibm-iaccess-1.1.0.11-1.0.amd64.deb

sudo apt-get --fix-broken install

echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p

sudo cp /home/vagrant/printapp/vagrant-files/templates/php_xdebug.ini.j2 /etc/php/7.4/mods-available/xdebug.ini
