export EDITOR=code

export DOTILES=$HOME/.dotfiles/

export PATH=$HOME/.local/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH

export PATH=$HOME/.npm/bin:$PATH

# Fzf config
export FZF_COMPLETION_OPTS="--border=rounded --layout=reverse --no-info"
export FZF_DEFAULT_OPTS="--border=rounded --layout=reverse --no-info --height 40% --ansi"
export FZF_CTRL_R_OPTS="--border-label='History Search'"
export FZF_ALT_C_OPTS="--border-label='Directory Search'"
export FZF_ALT_C_COMMAND='fd --type d --exclude .steam --hidden --follow . "$HOME"'
export FZF_CTRL_T_COMMAND='fd  --hidden --exclude .steam --follow . "$HOME"'
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude .steam --hidden --color=always'

if [ -f "$HOME/.cargo/env" ]; then
  source $HOME/.cargo/env
fi

if [ -e /home/shad/.nix-profile/etc/profile.d/nix.sh ]; then . /home/shad/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
