# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# shellcheck disable=2296
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    # shellcheck disable=1090
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
source "$HOME/.zshenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Theme
# shellcheck disable=2034
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto Update
zstyle ':omz:update' mode disabled
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14

# shellcheck disable=2034
COMPLETION_WAITING_DOTS="true"

# shellcheck disable=2034
ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

# Configureation for ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identies ~/.ssh/id_ed25519
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes

# shellcheck disable=2034
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
    ssh-agent
	tmux
	vi-mode
	zoxide
	zsh-autosuggestions
	zsh-bat
	zsh-eza
	"$OS_PLUGIN"
)

# shellcheck disable=SC1091
source "$ZSH/oh-my-zsh.sh"

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
alias vim="nvim"
alias tinker="php artisan tinker"
alias a="php artisan"

# Php Dev Aliases
alias xoff='sudo phpdismod xdebug'
alias xon='sudo phpenmod xdebug'

[ -f ~/.fzf.zsh ] && source "$HOME/.fzf.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# shellcheck disable=1090
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

