# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Theme
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Auto Update
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it'S time
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

plugins=(
    aliases
    alias-finder
    ansible
    zsh-eza
    fast-syntax-highlighting
    fd
    git
    git-flow
    systemd
    vi-mode
    zoxide
    zsh-autosuggestions
    zsh-bat
    "$OS_PLUGIN"
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Keybinds
bindkey '^ ' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'ee' edit-command-line

# Functions

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
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias gs="git status"
alias gpl="git pull"
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias gpoat="git push origin --all && git push origin --tags"
alias lg="lazygit"
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

if [[ -d "$HOME/.fzf" ]]; then
   source "$HOME/.fzf/shell/completion.zsh"
   source "$HOME/.fzf/shell/key-bindings.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
