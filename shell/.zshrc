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
zplug "~/.dotfiles/zsh-plugins/defaults", from:local
zplug "~/.dotfiles/zsh-plugins/vim", from:local
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
zplug "~/.dotfiles/zsh-plugins/systemd", from:local
zplug "plugins/git-flow", from:oh-my-zsh
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

# Aliases
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'
alias tinker="php artisan tinker"
alias artisan="php artisan"
alias gpoat="git push origin --all && git push origin --tags"

# Set FZF Options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
