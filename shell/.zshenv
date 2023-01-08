export EDITOR=lvim

export ZPLUG_HOME=$HOME/.local/share/zplug

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

export PATH=$HOME/.local/bin:$PATH

export COMPOSER_HOME=$HOME/.composer

# PATH Set up
export PATH=$HOME/.npm/bin:$PATH
export PATH=/usr/local/lib/npm/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH="$HOME/.local/share/gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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
export FZF_ALT_C_COMMAND="fd -t d -H --exclude .git . $HOME"
export FZF_CTRL_T_COMMAND="fd --hidden"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --color=always --exclude .git'
