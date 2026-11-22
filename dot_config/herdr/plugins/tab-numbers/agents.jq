# Agents in "spaces" sidebar order (workspace, then tab, then pane), each with
# its 1-based position as .n. Input: `herdr api snapshot` output.
.result.snapshot as $s
| ($s.workspaces | map({(.workspace_id): .}) | add // {}) as $ws
| ($s.tabs | map({(.tab_id): .}) | add // {}) as $tabs
| ($s.panes | to_entries | map({(.value.pane_id): .key}) | add // {}) as $pn
| $s.agents
| sort_by($ws[.workspace_id].number, $tabs[.tab_id].number, $pn[.pane_id])
| to_entries
| map(.value + {
    n: (.key + 1),
    workspace_label: ($ws[.value.workspace_id].label // .value.workspace_id),
    tab_label: ($tabs[.value.tab_id].label // .value.tab_id)
  })
