#!/usr/bin/env bash
# Keybind helper: open an app entrypoint in a new focused tab, starting in the
# directory of the pane the key was pressed in. The directory goes through env
# rather than --cwd, because herdr resolves the relative run.sh against it.
# Usage: open.sh <entrypoint>
set -euo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"
args=(plugin pane open --plugin shadk.apps --entrypoint "$1" --placement tab --no-focus)
[[ -n ${HERDR_ACTIVE_PANE_CWD:-} ]] && args+=(--env "APP_CWD=$HERDR_ACTIVE_PANE_CWD")
tab=$("$herdr" "${args[@]}" | jq -r '.result.plugin_pane.pane.tab_id')

# Focusing through pane open moves the server's focus but not the attached
# client's view; an explicit tab focus switches the client too.
"$herdr" tab focus "$tab" >/dev/null
