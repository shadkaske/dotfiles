export EDITOR=lvim

export ZPLUG_HOME=$HOME/.local/share/zplug

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

export PATH=$HOME/.local/bin:$PATH

export COMPOSER_HOME=$HOME/.composer

# PATH Set up
[ -d $HOME/.npm/bin ] && export PATH=$HOME/.npm/bin:$PATH
[ -d /usr/local/lib/npm/bin ] && export PATH=/usr/local/lib/npm/bin:$PATH
[ -d $HOME/.config/composer/vendor/bin ] && export PATH=$HOME/.config/composer/vendor/bin:$PATH
[ -d $HOME/.composer/vendor/bin ] && export PATH=$HOME/.composer/vendor/bin:$PATH
[ -d $HOME/.local/share/gem/ruby/2.7.0/bin ] && export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH"
[ -d $HOME/.local/share/gem/ruby/3.0.0/bin ] && export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
[ -d $HOME/go/bin ] && export PATH="$HOME/go/bin:$PATH"
[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Virsh Default Connection
export LIBVIRT_DEFAULT_URI="qemu:///system"

# AskPass Helper
export SUDO_ASKPASS='/usr/bin/ssh-askpass'

# Fzf config
export FZF_COMPLETION_OPTS='--border --info=inline'
