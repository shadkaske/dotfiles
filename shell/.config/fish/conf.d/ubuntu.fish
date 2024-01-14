abbr --add acs apt-cache search
abbr --add afs apt-file search --regexp
# These are apt/apt-get only
abbr --add ags apt source

abbr --add acp apt-cache policy

#List all installed packages
abbr --add agli apt list --installed

# List available updates only
abbr --add aglu apt list --upgradable

abbr --add afu sudo apt-file update

abbr --add ppap sudo ppa-purge

abbr --add age sudo apt
abbr --add aga sudo apt autoclean
abbr --add agb sudo apt build-dep
abbr --add agc sudo apt clean
abbr --add agd sudo apt dselect-upgrade
abbr --add agi sudo apt install
abbr --add agp sudo apt purge
abbr --add agr sudo apt remove
abbr --add agu sudo apt update
abbr --add agud "sudo apt update && sudo apt dist-upgrade"
abbr --add agug sudo apt upgrade
abbr --add aguu "sudo apt update && sudo apt upgrade"
abbr --add agar sudo apt autoremove

abbr --add allpkgs dpkg --get-selections | grep -v deinstall
