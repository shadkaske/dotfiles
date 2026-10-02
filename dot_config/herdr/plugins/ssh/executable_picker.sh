#!/usr/bin/env bash
# Popup entrypoint: fuzzy-pick a host, then open it in a new tab.
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"

# Bare list: the herdr popup already supplies the frame and title.
host=$(bash hosts.sh | fzf \
  --no-border --no-scrollbar \
  --reverse --no-sort \
  --prompt '󰣀  ' \
  --bind 'tab:down,btab:up')

[[ -n $host ]] || exit 0

# Open the tab unfocused: the attached client ignores focus changes made while
# the popup is up, and when the popup closes it returns to the pane it opened
# over. A detached helper focuses the tab once this process (and so the popup)
# is gone, so the client sees a real focus change.
tab=$("$herdr" plugin pane open --plugin "$HERDR_PLUGIN_ID" --entrypoint session \
  --placement tab --env "SSH_HOST=$host" --no-focus | jq -r '.result.plugin_pane.pane.tab_id')

setsid -f bash -c '
  while kill -0 "$1" 2>/dev/null; do sleep 0.05; done
  sleep 0.1
  "$2" tab focus "$3"
' _ "$$" "$herdr" "$tab" </dev/null >/dev/null 2>&1
