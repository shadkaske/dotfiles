#!/usr/bin/env bash
tmux new-window -c '#{pane_current_path}' './vendor/bin/sail down && ./vendor/bin/sail up'
sleep 2
tmux split-window -c '#{pane_current_path}' -v './vendor/bin/sail yarn run dev'
tmux select-window -t 1
nvim
