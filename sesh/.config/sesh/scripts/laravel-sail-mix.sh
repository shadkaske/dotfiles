#!/usr/bin/env bash
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Sail' './vendor/bin/sail down && ./vendor/bin/sail up'
sleep 2
tmux split-window -c '#{pane_current_path}' -v ./vendor/bin/sail yarn run watch-poll
tmux select-window -t 1
nvim
