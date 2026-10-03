#!/usr/bin/env bash
# Relabel every tab as "<position>: <name>". Tabs without a custom name keep
# herdr's bare-number label, so they show just "<position>".
# Also publish each workspace's sidebar position as the $ws_num metadata token,
# so the sidebar can show it without renaming the workspace.
# Our own renames fire tab.renamed again; that pass finds nothing to change.
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"

# Events can arrive in bursts; let one pass run at a time.
exec 9>"${HERDR_PLUGIN_STATE_DIR:-/tmp}/renumber.lock"
flock 9

"$herdr" api snapshot | jq -r '
  .result.snapshot.tabs
  | group_by(.workspace_id)[]
  | to_entries[]
  | (.key + 1 | tostring) as $n
  | (.value.label | sub("^[0-9]+: "; "")) as $base
  | (if ($base | test("^[0-9]+$")) then $n else "\($n): \($base)" end) as $want
  | select(.value.label != $want)
  | [.value.tab_id, $want] | @tsv
' | while IFS=$'\t' read -r tab label; do
  "$herdr" tab rename "$tab" "$label" >/dev/null
done

# Workspace numbers match the sidebar order (and switch_workspace).
"$herdr" workspace list | jq -r '.result.workspaces[] | [.workspace_id, .number] | @tsv' |
  while IFS=$'\t' read -r ws n; do
    "$herdr" workspace report-metadata "$ws" --source "$HERDR_PLUGIN_ID" --token "ws_num=[$n]" >/dev/null
  done
