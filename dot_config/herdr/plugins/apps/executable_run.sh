#!/usr/bin/env bash
# Tab entrypoint: name the tab, then replace this shell with the app so the
# tab closes when the app exits.
# Usage: run.sh <tab label> <command> [args...]
label=$1; shift
if [[ -n ${HERDR_TAB_ID:-} ]]; then
  "${HERDR_BIN_PATH:-herdr}" tab rename "$HERDR_TAB_ID" "$label" >/dev/null 2>&1
fi
cd "${APP_CWD:-$HOME}" 2>/dev/null || cd "$HOME"
exec "$@"
