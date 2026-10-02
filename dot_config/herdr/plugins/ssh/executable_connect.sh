#!/usr/bin/env bash
# Action entrypoint: open the host picker popup.
set -euo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"
exec "$herdr" plugin pane open --plugin "$HERDR_PLUGIN_ID" --entrypoint picker --focus >/dev/null
