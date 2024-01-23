export EDITOR=nvim

export PATH=$HOME/.local/bin:$PATH

# Add smart tmux script
if [ -d "$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin" ]; then
    export PATH="$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
    export T_SESSION_NAME_INCLUDE_PARENT="true"
fi

export BAT_THEME="Catppuccin-mocha"

# Fzf config
# export FZF_COMPLETION_OPTS="--border=rounded --layout=reverse --no-info"
export FZF_DEFAULT_OPTS=" \
--border=rounded \
--layout=reverse \
--no-info \
--height 40% \
--ansi"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

if [ -f "$HOME/.cargo/env" ]; then
  source $HOME/.cargo/env
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

if [ -d "$HOME/.npm/bin" ]; then
    export PATH=$HOME/.npm/bin:$PATH
fi

if [ -d "/snap/node/current/bin" ]; then
    export PATH=/snap/node/current/bin:$PATH
fi

OS_NAME=$( (lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1 | tr -d '"')
case "$OS_NAME" in
    "Arch Linux") export OS_PLUGIN=archlinux
    ;;
    *) export OS_PLUGIN=ubuntu
    ;;
esac

export PATH="$PATH:/home/kaskshad/.local/share/npm/bin"
export PATH="$PATH:/snap/node/current/bin"

