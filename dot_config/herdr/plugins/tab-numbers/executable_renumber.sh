#!/usr/bin/env bash
# Relabel every tab as "<position>: <name>". Tabs without a custom name keep
# herdr's bare-number label, so they show just "<position>".
# Also publish each workspace's sidebar position as the $ws_num metadata token,
# so the sidebar can show it without renaming the workspace, and each agent's
# sidebar position as the $agent_num pane token (matches focus_agent).
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

# Agent numbers follow the "spaces" sidebar order: workspace, then tab, then
# pane. Only rewrite tokens that changed, since agent status events are chatty.
state="${HERDR_PLUGIN_STATE_DIR:-/tmp}/agent_nums"
touch "$state"
"$herdr" api snapshot | jq -f agents.jq | jq -r '.[] | [.pane_id, (.n | tostring)] | @tsv' >"$state.new"
comm -13 <(sort "$state") <(sort "$state.new") |
  while IFS=$'\t' read -r pane n; do
    "$herdr" pane report-metadata "$pane" --source "$HERDR_PLUGIN_ID" --token "agent_num=[$n]" >/dev/null
  done
mv "$state.new" "$state"
