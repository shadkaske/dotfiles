export EDITOR=nvim

export LANG=en_US.UTF-8

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

# Path Bit
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/npm/bin:$PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:$HOME/.fzf/bin"
export PATH=$HOME/.cargo/bin:$PATH

export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Fzf config
export FZF_DEFAULT_OPTS=" \
    --border=rounded \
    --layout=reverse \
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
    --color=selected-bg:#494d64 \
    --multi"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search' --preview 'bat {}'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

