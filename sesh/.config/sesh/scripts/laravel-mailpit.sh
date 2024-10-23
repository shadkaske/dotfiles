#!/usr/bin/env bash
ARG1=${1:-localhost}
tmux rename-window 'Editor'
tmux new-window -c '#{pane_current_path}' -n 'Servers' yarn run dev --host=$ARG1.test
tmux split-window -c '#{pane_current_path}' -v "php artisan serve --host=$ARG1.test"
tmux split-window -c '#{pane_current_path}' -v "mailpit"
tmux split-window -c '#{pane_current_path}' -v "php artisan queue:listen"
tmux split-window -c '#{pane_current_path}' -v "while true; do php artisan schedule:run; sleep 60; done"
tmux select-window -t 1
nvim
