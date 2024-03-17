#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\u@\h \W \$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

if [[ -d "~/.fzf" ]]; then
    export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
    source "$HOME/.fzf/shell/completion.bash"
    source "$HOME/.fzf/shell/key-bindings.bash"
fi

if [[ -d "/usr/share/fzf" ]]; then
    source /usr/share/fzf/completion.bash
    source /usr/share/fzf/key-bindings.bash
fi
