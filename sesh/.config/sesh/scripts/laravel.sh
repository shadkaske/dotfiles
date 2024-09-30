#!/usr/bin/env bash
ARG1=${1:-localhost}
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Servers' yarn run dev --host=$ARG1.test
tmux split-window -c '#{pane_current_path}' -v php artisan serve --host=$ARG1.test
tmux select-window -t 1
nvim
