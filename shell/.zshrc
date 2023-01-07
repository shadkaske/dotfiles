# Bootstrap Fzf
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    $HOME/.fzf/install --no-fish --all

####################################
# Zplug
####################################
# Bootstrap zplug if missing
[ ! -d $HOME/.local/share/zplug ] && git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Load Zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "shadkaske/zsh-defaults"
zplug "shadkaske/zsh-vim"
zplug "fdellwing/zsh-bat"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "TwoPizza9621536/zsh-exa"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "akash329d/zsh-alias-finder"
zplug "hlissner/zsh-autopair"
zplug "sparsick/ansible-zsh"
zplug "jessarcher/zsh-artisan"
zplug "davidde/git"
zplug "shadkaske/zsh-systemd"
zplug "plugins/git-flow", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh
# zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zap-zsh/zap-prompt", as:theme

# Install Missing Plugins
if ! zplug check --verbose; then
  zplug install
fi

zplug load

# Keybind for zsh-autosuggestions Ctrl + <space> to accept
bindkey '^ ' autosuggest-accept

# Set FZF Options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --hidden --ignore-case --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

alias fa="alias | fzf"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
