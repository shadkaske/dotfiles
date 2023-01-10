# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shad/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/shad/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/shad/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/shad/.fzf/shell/key-bindings.bash"
