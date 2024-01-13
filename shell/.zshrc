# If you come from bash you might have to change your $PATH.
source "$HOME/.zshenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Theme
ZSH_THEME="agnoster"

# Auto Update
zstyle ':omz:update' mode disabled
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

# Configureation for ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identies ~/.ssh/id_ed25519
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes

plugins=(
	alias-finder
	aliases
	ansible
	artisan
	composer
	fast-syntax-highlighting
	fd
	git
	git-flow
	systemd
	tmux
	vi-mode
	zoxide
	zsh-autosuggestions
	zsh-bat
	zsh-eza
	"$OS_PLUGIN"
)

source $ZSH/oh-my-zsh.sh

# Keybinds
bindkey '^f' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'ee' edit-command-line

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
alias gpl="git pull"
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias gpoat="git push origin --all && git push origin --tags"
alias lg="lazygit"
alias fm="ranger"
alias tsu="sudo tailscale up --accept-routes"
alias tsd="sudo tailscale down"
alias lap="eza -alh | batcat -l fs"
alias cl="clear"
alias nv="nvim"
alias n="nvim"
alias tinker="php artisan tinker"
alias a="php artisan"

# Php Dev Aliases
alias xoff='sudo phpdismod xdebug'
alias xon='sudo phpenmod xdebug'

[ -f ~/.local/share/fzf.zsh ] && source ~/.local/share/fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# vim: set ft=sh:
