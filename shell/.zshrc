# If you come from bash you might have to change your $PATH.
source "$HOME/.zshenv"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Autoswitch
export AUTOSWITCH_MESSAGE_FORMAT="Switching to %venv_name   %py_version"

# Auto Update
zstyle ':omz:update' mode disabled
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 14

# shellcheck disable=2034
COMPLETION_WAITING_DOTS="true"

# shellcheck disable=2034
ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

# sourcing mode for vi mode
ZVM_INIT_MODE=sourcing

# Fire up ssh agent if there isn't a socket
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
# Configureation for ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identies ~/.ssh/id_ed25519
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent lazy yes

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
    docker-compose
    firewalld
    ssh-agent
    ubuntu
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

# Functions
function sailinit() {
    docker run --rm \
      -u "$(id -u):$(id -g)" \
      -v $(pwd):/var/www/html \
      -w /var/www/html \
      laravelsail/php"${2:=83}"-composer:latest \
      composer install --ignore-platform-reqs
}

# Laravel Sail Bits, use sail for it's needs, if composer is needed outside of that use docker image
: ${SAIL_ZSH_BIN_PATH:="./vendor/bin/sail"}

# Enable multiple commands with sail
function artisan \
         composer \
         node \
         npm \
         npx \
         php \
         yarn {
  if checkForSail; then
    $SAIL_ZSH_BIN_PATH "$0" "$@"
  else
    if [[ "$0" == "composer" ]]; then
        # Direct composer to docker
        export COMPOSER_HOME="$HOME/.config/composer"
        export COMPOSER_CACHE_DIR="$HOME/.cache/composer"
        docker run --rm --interactive --tty \
          --env COMPOSER_HOME \
          --env COMPOSER_CACHE_DIR \
          --volume ${COMPOSER_HOME:-$HOME/.config/composer}:$COMPOSER_HOME \
          --volume ${COMPOSER_CACHE_DIR:-$HOME/.cache/composer}:$COMPOSER_CACHE_DIR \
          --volume $(pwd):/var/www/html \
          --workdir="/var/www/html" \
          --user="$(id -u):$(id -g)" \
          "$0" "$@"
    else
        # direct other outside of laravel project to system install
        command "$0" "$@"
    fi
  fi
}

checkForSail() {
  if [ -f $SAIL_ZSH_BIN_PATH ]; then
    return 0
  else
    return 1
  fi
}

# Custom bits for tmuxinator
compdef tmuxinator mux
alias mux="tmuxinator"

_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start|stop)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}

compdef _tmuxinator tmuxinator
alias muxstart='tmuxinator start'
alias muxopen='tmuxinator open'
alias muxnew='tmuxinator new'
alias muxls='tmuxinator list'
alias muxquit='tmuxinator stop'
alias tmx='tmuxinator-start'

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
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias sup='sh $([ -f sail ] && echo sail || echo vendor/bin/sail) up'
alias supd='sh $([ -f sail ] && echo sail || echo vendor/bin/sail) up -d'
alias sdown='sh $([ -f sail ] && echo sail || echo vendor/bin/sail) down'
alias sbn='sh $([ -f sail ] && echo sail || echo vendor/bin/sail) build --no-cache'
alias sb='sh $([ -f sail ] && echo sail || echo vendor/bin/sail) build'

if [[ -d "$HOME/.fzf" ]]; then
    export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
    source "$HOME/.fzf/shell/completion.zsh"
    source "$HOME/.fzf/shell/key-bindings.zsh"
fi

if [[ -d "/usr/share/fzf" ]]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

eval "$(starship init zsh)"

