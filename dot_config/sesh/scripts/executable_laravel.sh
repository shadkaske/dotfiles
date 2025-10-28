#!/usr/bin/env bash
tmux new-window -c '#{pane_current_path}' './vendor/bin/sail up'
tmux split-window -c '#{pane_current_path}' -v './vendor/bin/sail yarn run watch'
tmux select-window -t 1
nvim
