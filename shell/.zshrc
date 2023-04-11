# Bootstrap Fzf
[ ! -f $HOME/.fzf/bin/fzf ] && $HOME/.fzf/install --bin

# Bootstrap zplug if missing
[ ! -d $HOME/.local/share/zplug ] && git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Import Cargo Env if it exists
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# Init Zplug
source $ZPLUG_HOME/init.zsh

# Plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "$LOCAL_ZPLUG/defaults", from:local
zplug "$LOCAL_ZPLUG/vim", from:local
zplug "fdellwing/zsh-bat"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "TwoPizza9621536/zsh-exa"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "akash329d/zsh-alias-finder"
zplug "sparsick/ansible-zsh"
zplug "jessarcher/zsh-artisan"
zplug "davidde/git"
zplug "$LOCAL_ZPLUG/systemd", from:local
zplug "$LOCAL_ZPLUG/git-flow", from:local
zplug "$LOCAL_ZPLUG/dir", from:local
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh, if:"[[ "$PACKAGE_MANAGER" =~ "apt" ]]"
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install Missing Plugins
if ! zplug check --verbose; then
  zplug install
fi

# Load Zplug Plugins and stuff
zplug load

# Keybinds
bindkey '^ ' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'ee' edit-command-line

# Functions
# mkcd is equivalent to takedir
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
  if [[ $1 =~ ^(https?|ftp).*\.tar\.(gz|bz2|xz)$ ]]; then
    takeurl "$1"
  elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
    takegit "$1"
  else
    takedir "$@"
  fi
}

function homestead() {
    ( cd $HOME/Code/Homestead && vagrant $* )
}

# Zoxide
_z_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}

zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}

alias za='zoxide add'
alias zq='zoxide query'
alias zqi='zoxide query -i'

alias zr='zoxide remove'
zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}

_zoxide_hook() {
    zoxide add "$(pwd -L)"
}

chpwd_functions=(${chpwd_functions[@]} "_zoxide_hook")

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
# Aliases
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'
alias tinker="php artisan tinker"
alias artisan="php artisan"
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

# Set FZF Options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
