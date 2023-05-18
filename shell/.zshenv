export EDITOR=nvim

export ZPLUG_HOME=$HOME/.local/share/zplug

export DOTILES=$HOME/.dotfiles/

export LOCAL_ZPLUG=$HOME/.dotfiles/zsh-plugins

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

export PATH=$HOME/.local/bin:$PATH

export COMPOSER_HOME=$HOME/.composer

# PATH Set up
export PATH=$HOME/.npm/bin:$PATH
export PATH=/usr/local/lib/npm/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=/var/lib/flatpak/exports/bin:$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Virsh Default Connection
export LIBVIRT_DEFAULT_URI="qemu:///system"

# AskPass Helper
export SUDO_ASKPASS='/usr/bin/ssh-askpass'

# Fzf config
export FZF_COMPLETION_OPTS="--border=rounded --layout=reverse --no-info"
export FZF_DEFAULT_OPTS="--border=rounded --layout=reverse --no-info --height 40% --ansi"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

export OS_RELEASE=$(cat /etc/os-release | grep -Po '^ID=\K.*')

case "$OS_RELEASE" in
  pop) export OS_ICON="  "
    export PACKAGE_MANAGER=apt
  ;;
  debian) export OS_ICON="  "
    export PACKAGE_MANAGER=apt
  ;;
  ubuntu) export OS_ICON="  "
    export PACKAGE_MANAGER=apt
  ;;
  fedora) export OS_ICON="  "
    export PACKAGE_MANAGER=dnf
  ;;
  arch) export OS_ICON="  "
    export PACKAGE_MANAGER=pacman
  ;;
  *) export OS_ICON="  "
    export PACKAGE_MANAGER=""
  ;;
esac

if [ -f "$HOME/.cargo/env" ]; then
  source $HOME/.cargo/env
fi

if [ -f "$HOME/.bwsession" ]; then
  source $HOME/.bwsession
fi
