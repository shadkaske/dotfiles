#!/usr/bin/env bash
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Servers' yarn run dev
tmux split-window -v -p 50 "php artisan serve"
tmux select-window -t 1
nvim -c ':Telescope find_files'
