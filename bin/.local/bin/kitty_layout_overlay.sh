#!/usr/bin/env bash
active_tab="$(
  kitty @ ls | jq -r ' .[] | select(.is_active) | .tabs[] | select(.is_active) '
)"

tab_id="$(jq -r '.id' <<<"${active_tab}")"
tab_layouts="$(jq -r '
    . as $tab
    | .enabled_layouts[]
    | (if . == $tab.layout then "*" else " " end) + " " + .
' <<<"${active_tab}")"

selected_layout="$(fzf --reverse <<<"${tab_layouts}" | cut -c 3-)"

if [[ -n "$selected_layout" ]]; then
  kitty @ goto-layout -m "id:${tab_id}" "${selected_layout}"
fi
