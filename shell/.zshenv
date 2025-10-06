export EDITOR=nvim

export COLOR_SCHEME=tokyonight

export LANG=en_US.UTF-8

export TERMINAL=kitty

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

# Path Bit
export PATH=$HOME/.local/bin:$PATH

export PATH=$HOME/.local/share/npm/bin:$PATH

export PATH=/snap/node/current/bin:$PATH

export PATH="$HOME/go/bin:$PATH"

export PATH="$PATH:$HOME/.fzf/bin"

export PATH=$HOME/.cargo/bin:$PATH

export PATH=$HOME/.config/composer/vendor/bin:$PATH

export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"

export COMPOSE_MENU=false

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Fzf config
export FZF_DEFAULT_OPTS=" \
    --border=rounded \
    --layout=reverse \
    --color=bg+:#283457 \
    --color=bg:#1a1b26 \
    --color=border:#27a1b9 \
    --color=fg:#c0caf5 \
    --color=gutter:#16161e \
    --color=header:#ff9e64 \
    --color=hl+:#2ac3de \
    --color=hl:#2ac3de \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#2ac3de \
    --color=query:#c0caf5:regular \
    --color=scrollbar:#27a1b9 \
    --color=separator:#ff9e64 \
    --color=spinner:#ff007c \
    --ansi \
    --multi"

# Tokyo Night Fzf Colors
# --color=bg+:#283457 \
# --color=bg:#1a1b26 \
# --color=border:#27a1b9 \
# --color=fg:#c0caf5 \
# --color=gutter:#16161e \
# --color=header:#ff9e64 \
# --color=hl+:#2ac3de \
# --color=hl:#2ac3de \
# --color=info:#545c7e \
# --color=marker:#ff007c \
# --color=pointer:#ff007c \
# --color=prompt:#2ac3de \
# --color=query:#c0caf5:regular \
# --color=scrollbar:#27a1b9 \
# --color=separator:#ff9e64 \
# --color=spinner:#ff007c \

# catppuccin-mocha
# --color=bg+:#313244 \
# --color=bg:#1e1e2e \
# --color=border:#cba6f7 \
# --color=fg+:#cdd6f4 \
# --color=fg:#cdd6f4 \
# --color=header:#f38ba8 \
# --color=hl+:#f38ba8 \
# --color=hl:#f38ba8 \
# --color=info:#cba6f7 \
# --color=label:#cdd6f4 \
# --color=marker:#b4befe
# --color=pointer:#f5e0dc \
# --color=prompt:#cba6f7 \
# --color=selected-bg:#45475a \
# --color=spinner:#f5e0dc \

export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_CTRL_T_OPTS="--border-label='File Search' --preview 'bat {}'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'
