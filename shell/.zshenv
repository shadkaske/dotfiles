export EDITOR=nvim

export LANG=en_US.UTF-8

# Path Bit
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/npm/bin:$PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:$HOME/.fzf/bin"
export PATH=$HOME/.cargo/bin:$PATH

export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# # Fzf config
export FZF_DEFAULT_OPTS=" \
    --border=rounded \
    --layout=reverse \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search' --preview 'bat {}'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

