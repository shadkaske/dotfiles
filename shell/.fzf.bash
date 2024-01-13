# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shadkaske/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/shadkaske/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/shadkaske/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/shadkaske/.fzf/shell/key-bindings.bash"
