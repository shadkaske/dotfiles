typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# If you come from bash you might have to change your $PATH.
source "$HOME/.zshenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Powerlevel 10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Autoswitch
export AUTOSWITCH_MESSAGE_FORMAT="Switching to %venv_name   %py_version"

# Auto Update
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14

# shellcheck disable=2034
COMPLETION_WAITING_DOTS="true"

# shellcheck disable=2034
ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

# sourcing mode for vi mode
ZVM_INIT_MODE=sourcing

# Configureation for ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identies ~/.ssh/id_ed25519
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy no

# Override zoxide to use cd
ZOXIDE_CMD_OVERRIDE="cd"

plugins=(
	artisan
	fast-syntax-highlighting
	fd
	git
	git-flow
	systemd
	tmux
	zoxide
	zsh-autosuggestions
	zsh-bat
	zsh-eza
	zsh-vi-mode
    archlinux
    autoswitch_virtualenv
    firewalld
    ssh-agent
    ubuntu
    dnf
)

# shellcheck disable=SC1091
source "$ZSH/oh-my-zsh.sh"

# Keybinds
bindkey '^f' autosuggest-accept
autoload -Uz edit-command-line

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
alias lap="eza -alh | bat -l fs"
alias cl="clear"
alias v="nvim"
alias n="nvim"
alias vim="nvim"

alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'
alias s='sesh cn $(sesh l | fzf)'

if [[ -d "$HOME/.fzf" ]]; then
    export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
    source "$HOME/.fzf/shell/completion.zsh"
    source "$HOME/.fzf/shell/key-bindings.zsh"
fi

if [[ -f "$HOME/.config/fsh/catppuccin-macchiato.ini" ]]; then
    fast-theme XDG:catppuccin-macchiato > /dev/null
fi

# Create bat cache if missing
if [[ ! -d "$HOME/.cache/bat" ]]; then
    bat cache --build >/dev/null
fi

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
