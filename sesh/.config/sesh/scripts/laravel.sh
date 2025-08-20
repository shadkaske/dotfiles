#!/usr/bin/env bash
tmux new-window -c '#{pane_current_path}' 'php artisan serve --host=localhost'
tmux split-window -c '#{pane_current_path}' -v yarn run dev
tmux split-window -c '#{pane_current_path}' -h 'php artisan pail --timeout=0'
tmux select-window -t 1
nvim
