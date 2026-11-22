#!/usr/bin/env bash
# Bound to prefix+o in config.toml: focus the agent that most needs you.
# Blocked (waiting on an approval or question) beats done (finished, unseen);
# ties go to the most recent state change. The focused pane is skipped, so
# pressing again moves on to the next one. Does nothing if no agent needs you.
set -uo pipefail
herdr="${HERDR_BIN_PATH:-herdr}"

pane=$("$herdr" agent list | jq -r '
  [.result.agents[]
   | select(.focused | not)
   | select(.agent_status == "blocked" or .agent_status == "done")]
  | sort_by((if .agent_status == "blocked" then 0 else 1 end), -(.state_change_seq // 0))
  | first | .pane_id // empty')

[[ -n $pane ]] && exec "$herdr" agent focus "$pane" >/dev/null
exit 0
