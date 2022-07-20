#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.


# If you're not quite ready for the latest Node.js version,
# uncomment these lines to roll back to a previous version

# Remove current Node.js version:
#sudo apt-get -y purge nodejs
#sudo rm -rf /usr/lib/node_modules/npm/lib
#sudo rm -rf //etc/apt/sources.list.d/nodesource.list

# Install Node.js Version desired (i.e. v13)
# More info: https://github.com/nodesource/distributions/blob/master/README.md#debinstall
#curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
#sudo apt-get install -y nodejs

sudo apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install ripgrep tmux git-flow

sudo dpkg -i $HOME/printapp/vagrant-files/ibm-iaccess-1.1.0.11-1.0.amd64.deb

sudo apt-get --fix-broken install

echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p

sudo cp /home/shad/Code/printapp/vagrant-files/templates/php_xdebug.ini.j2 /etc/php/7.4/cli/confi.d/20-xdebug.ini
