#!/usr/bin/env bash
# Action entrypoint: open the host picker popup. The pane the key was pressed
# in (HERDR_PANE_ID for actions) is passed along so the picker can split it.
set -euo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"
args=(plugin pane open --plugin "$HERDR_PLUGIN_ID" --entrypoint picker --focus)
[[ -n ${HERDR_PANE_ID:-} ]] && args+=(--env "SSH_TARGET_PANE=$HERDR_PANE_ID")
exec "$herdr" "${args[@]}" >/dev/null
