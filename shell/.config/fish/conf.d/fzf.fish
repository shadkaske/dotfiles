set -Ux FZF_DEFAULT_OPTS "--border rounded --layout reverse --no-info --height 40% --ansi"
set -Ux FZF_CTRL_R_OPTS "--border-label 'History Search'"
set -Ux FZF_CTRL_T_OPTS "--border-label 'File Search'"
set -Ux FZF_ALT_C_OPTS "--border-label 'Directory Search'"
set -g FZF_ALT_C_COMMAND "command fd --type d --exclude .steam --hidden --follow . $HOME"
set -g FZF_CTRL_T_COMMAND "command fd  --hidden --exclude .steam --follow . $HOME"
set -g FZF_DEFAULT_COMMAND "command fd --type file --follow --exclude .steam --hidden --color always"

