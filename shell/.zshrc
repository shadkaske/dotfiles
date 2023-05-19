# If you come from bash you might have to change your $PATH.
source "$HOME/.zshenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Theme
ZSH_THEME="awesomepanda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Auto Update
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

plugins=(
    aliases
    exa
    fast-syntax-highlighting
    fd
    git
    git-flow
    systemd
    ubuntu
    vagrant
    vi-mode
    zsh-alias-finder
    zsh-autosuggestions
    zsh-bat
    zoxide
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Keybinds
bindkey '^ ' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'ee' edit-command-line

# Functions

function homestead() {
    ( cd $HOME/Homestead && vagrant $* )
}

function php74() {
    sudo update-alternatives --set php /usr/bin/php7.4
    sudo update-alternatives --set php-config /usr/bin/php-config7.4
    sudo update-alternatives --set phpize /usr/bin/phpize7.4
}

function php80() {
    sudo update-alternatives --set php /usr/bin/php8.0
    sudo update-alternatives --set php-config /usr/bin/php-config8.0
    sudo update-alternatives --set phpize /usr/bin/phpize8.0
}

function php81() {
    sudo update-alternatives --set php /usr/bin/php8.1
    sudo update-alternatives --set php-config /usr/bin/php-config8.1
    sudo update-alternatives --set phpize /usr/bin/phpize8.1
}

function php82() {
    sudo update-alternatives --set php /usr/bin/php8.2
    sudo update-alternatives --set php-config /usr/bin/php-config8.2
    sudo update-alternatives --set phpize /usr/bin/phpize8.2
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases
alias gs="git status"
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias gpoat="git push origin --all && git push origin --tags"
alias lg="lazygit"
alias lgd="lazygit -p $HOME/.dotfiles"
alias lgl="lazygit -p $HOME/.dotfiles"
alias tnd="tmux new-session -A -s Dotfiles -c $HOME/.dotfiles"
alias tnn="tmux new-session -A -s NvimConfig -c $HOME/.config/nvim"
alias fm="ranger"
alias c="code ."
alias tsu="sudo tailscale up --accept-routes"
alias tsd="sudo tailscale down"

# Php Dev Aliases
alias tinker="php artisan tinker"
alias artisan="php artisan"
alias a="php artisan"
alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

