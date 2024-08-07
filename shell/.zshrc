# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Initialize zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"

[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -a --color $realpath'

zinit cdreplay -q

# sourcing mode for vi mode
ZVM_INIT_MODE=sourcing

# Configureation for ssh-agent
zstyle ':omz:plugins:ssh-agent' agent-forwarding yes
zstyle ':omz:plugins:ssh-agent' identies ~/.ssh/id_ed25519
zstyle ':omz:plugins:ssh-agent' quiet yes
zstyle ':omz:plugins:ssh-agent' lazy no

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light Aloxaf/fzf-tab
zinit light fdellwing/zsh-bat
zinit light jeffreytse/zsh-vi-mode
zinit light jessarcher/zsh-artisan
zinit light z-shell/zsh-eza
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

# Oh My Zsh Plugins
zinit snippet OMZP::git
zinit snippet OMZP::systemd
zinit snippet OMZP::firewalld
zinit snippet OMZP::ssh-agent
zinit snippet OMZP::ubuntu
zinit snippet OMZP::dnf
zinit snippet OMZP::sudo

# WordChars for more granular delete with control w
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Keybings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST="$HISTSIZE"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Zshell options
setopt no_beep
setopt auto_cd

# Aliases
alias gs="git status"
alias gpl="git pull"
alias gpoat="git push origin --all && git push origin --tags"
alias lg="lazygit"
alias fm="yazi"
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
alias -- -='cd -'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gcd='git checkout $(git config gitflow.branch.develop)'
alias gch='git checkout $(git config gitflow.prefix.hotfix)'
alias gcr='git checkout $(git config gitflow.prefix.release)'
alias gfl='git flow'
alias gflf='git flow feature'
alias gflff='git flow feature finish'
alias gflffc='git flow feature finish ${$(git_current_branch)#feature/}'
alias gflfp='git flow feature publish'
alias gflfpc='git flow feature publish ${$(git_current_branch)#feature/}'
alias gflfpll='git flow feature pull'
alias gflfs='git flow feature start'
alias gflh='git flow hotfix'
alias gflhf='git flow hotfix finish'
alias gflhfc='git flow hotfix finish ${$(git_current_branch)#hotfix/}'
alias gflhp='git flow hotfix publish'
alias gflhpc='git flow hotfix publish ${$(git_current_branch)#hotfix/}'
alias gflhs='git flow hotfix start'
alias gfli='git flow init'
alias gflr='git flow release'
alias gflrf='git flow release finish'
alias gflrfc='git flow release finish ${$(git_current_branch)#release/}'
alias gflrp='git flow release publish'
alias gflrpc='git flow release publish ${$(git_current_branch)#release/}'
alias gflrs='git flow release start'
alias tinker='php artisan tinker'

# Global Aliases
alias -g ...='../..'
alias -g ....='../../..'

# Functions
function mkcd takedir() {
  mkdir -p $@ && cd ${@:$#}
}

function takeurl() {
  local data thedir
  data="$(mktemp)"
  curl -L "$1" > "$data"
  tar xf "$data"
  thedir="$(tar tf "$data" | head -n 1)"
  rm "$data"
  cd "$thedir"
}

function takegit() {
  git clone "$1"
  cd "$(basename ${1%%.git})"
}

function take() {
  if [[ $1 =~ ^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$ ]]; then
    takeurl "$1"
  elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
    takegit "$1"
  else
    takedir "$@"
  fi
}

# Source fast-syntax-highlighting theme
if [[ -f "$HOME/.config/fsh/catppuccin-frappe.ini" ]]; then
    fast-theme XDG:catppuccin-frappe > /dev/null
fi

# Create bat cache if missing
if [[ ! -d "$HOME/.cache/bat" ]]; then
    bat cache --build >/dev/null
fi

# FZF
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
