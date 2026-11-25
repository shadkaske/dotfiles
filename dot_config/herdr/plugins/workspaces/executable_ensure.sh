#!/usr/bin/env bash
# Create each workspace in workspaces.list that isn't already open. Session
# restore runs before plugins start, so restored workspaces are skipped by label.
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"
list="$(dirname "${BASH_SOURCE[0]}")/workspaces.list"
[[ -f $list ]] || exit 0

open=$("$herdr" workspace list | jq -r '.result.workspaces[].label')

while read -r label cwd _; do
  [[ -z ${label:-} || $label == \#* ]] && continue
  grep -qxF -- "$label" <<<"$open" && continue
  cwd="${cwd/#\~/$HOME}"
  [[ -d $cwd ]] || { echo "skip $label: no such directory $cwd" >&2; continue; }
  "$herdr" workspace create --label "$label" --cwd "$cwd" --no-focus >/dev/null
done <"$list"
