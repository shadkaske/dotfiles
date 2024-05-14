export EDITOR=nvim

export PATH=$HOME/.local/bin:$PATH

# Add Go bin
if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.config/composer/vendor/bin" ]; then
    export PATH="$PATH:$HOME/.config/composer/vendor/bin"
fi

if [ -d "/usr/local/lib/npm/bin" ]; then
    export PATH="$PATH:/usr/local/lib/npm/bin"
fi

export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"

export MANROFFOPT="-c"

# Fzf config
# export FZF_COMPLETION_OPTS="--border=rounded --layout=reverse --no-info"
export FZF_DEFAULT_OPTS=" \
    --border=rounded \
    --layout=reverse \
    --color=spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search' --preview 'bat {}'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

if [[ -d "$HOME/.fzf" ]]; then
    export PATH="$PATH:$HOME/.fzf/bin"
fi

if [ -f "$HOME/.cargo/env" ]; then
  source $HOME/.cargo/env
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

if [ -d "$HOME/.local/share/npm/bin" ]; then
    export PATH=$HOME/.local/share/npm/bin:$PATH
fi

if [ -d "$HOME/.config/emacs/bin" ]; then
    export PATH=$HOME/.config/emacs/bin:$PATH
fi

if [ -d "/snap/node/current/bin" ]; then
    export PATH=/snap/node/current/bin:$PATH
fi

