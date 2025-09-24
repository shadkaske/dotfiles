#!/usr/bin/env bash

sessions_dir="$HOME/.config/kitty/sessions/"

select_session="$(ls $sessions_dir | fzf --border-label='Kitty Session Picker')"

if [[ -n $select_session ]]; then
  nohup "$(which kitty)" --session="$sessions_dir$select_session" >/dev/null 2>/dev/null &
  disown
  exit
fi
