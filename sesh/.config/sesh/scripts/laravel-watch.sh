#!/usr/bin/env bash
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Servers' yarn run watch
tmux split-window -c '#{pane_current_path}' -v "php artisan serve"
tmux select-window -t 1
nvim
