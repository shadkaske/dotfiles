#!/usr/bin/env bash
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Servers' yarn run dev
tmux split-window -c '#{pane_current_path}' -v "php artisan serve"
tmux split-window -c '#{pane_current_path}' -v "mailpit"
tmux select-window -t 1
nvim
