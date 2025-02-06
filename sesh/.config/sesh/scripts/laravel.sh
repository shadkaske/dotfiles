#!/usr/bin/env bash
ARG1=${1:-localhost}
tmux new-window -c '#{pane_current_path}' composer run dev
tmux select-window -t 1
nvim
