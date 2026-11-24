#!/usr/bin/env bash
# Session entrypoint: run ssh; the pane (or tab) closes when this exits.
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"

# Only rename the tab when it is ours; a split lives in someone else's tab.
if [[ ${SSH_PLACEMENT:-tab} == tab && -n ${HERDR_TAB_ID:-} ]]; then
  "$herdr" tab rename "$HERDR_TAB_ID" "ssh: $SSH_HOST" >/dev/null 2>&1
elif [[ -n ${HERDR_PANE_ID:-} ]]; then
  "$herdr" pane rename "$HERDR_PANE_ID" "ssh: $SSH_HOST" >/dev/null 2>&1
fi

start=$SECONDS
ssh "$SSH_HOST"
status=$?

# A quick failure (bad host, auth refused, unreachable) would otherwise close
# the tab before the error can be read.
if (( status == 255 && SECONDS - start < 5 )); then
  printf '\nssh exited with status %d. Press any key to close.' "$status"
  read -rsn1
fi
