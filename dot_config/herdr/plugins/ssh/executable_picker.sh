#!/usr/bin/env bash
# Popup entrypoint: fuzzy-pick a host, then open it in a vertical split to the
# right of the pane the picker was opened from (enter), or in a new tab (ctrl-t).
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"

# Bare list: the herdr popup already supplies the frame and title.
# --expect prints the accepting key on the first line, the host on the second.
out=$(bash hosts.sh | fzf \
  --no-border --no-scrollbar \
  --reverse --no-sort \
  --prompt '󰣀  ' \
  --header 'enter: split  ctrl-t: tab' \
  --expect ctrl-t \
  --bind 'tab:down,btab:up')

key=$(sed -n 1p <<<"$out")
host=$(sed -n 2p <<<"$out")
[[ -n $host ]] || exit 0

target=${SSH_TARGET_PANE:-}
if [[ $key == ctrl-t || -z $target ]]; then
  placement=tab
else
  placement=split
fi

# Open unfocused: the attached client ignores focus changes made while the
# popup is up, and when the popup closes it returns to the pane it opened over.
# A detached helper focuses the new pane/tab once this process (and so the
# popup) is gone, so the client sees a real focus change.
args=(plugin pane open --plugin "$HERDR_PLUGIN_ID" --entrypoint session
  --placement "$placement" --env "SSH_HOST=$host" --env "SSH_PLACEMENT=$placement" --no-focus)
[[ $placement == split ]] && args+=(--target-pane "$target" --direction right)
pane=$("$herdr" "${args[@]}" | jq -r '.result.plugin_pane.pane | "\(.tab_id) \(.pane_id)"')
read -r tab pane_id <<<"$pane"

setsid -f bash -c '
  while kill -0 "$1" 2>/dev/null; do sleep 0.05; done
  sleep 0.2
  [[ $2 == tab ]] && "$3" tab focus "$4"
  "$3" plugin pane focus "$5"
' _ "$$" "$placement" "$herdr" "$tab" "$pane_id" </dev/null >/dev/null 2>&1
