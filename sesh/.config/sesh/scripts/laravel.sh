#!/usr/bin/env bash
ARG1=${1:-localhost}
tmux new-window -c '#{pane_current_path}' php artisan serve --host=localhost
tmux split-window -c '#{pane_current_path}' -v yarn run dev --host=localhost
tmux select-window -t 1
nvim
