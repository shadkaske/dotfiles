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
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
    --color=selected-bg:#51576d \
    --multi"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search' --preview 'bat {}'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

