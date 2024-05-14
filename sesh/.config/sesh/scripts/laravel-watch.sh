#!/usr/bin/env bash
tmux rename-window 'editor'
tmux new-window -c '#{pane_current_path}' -n 'yarn' yarn run watch
tmux new-window -c '#{pane_current_path}' -n 'git' lazygit
tmux select-window -t 1
nvim -c ':Telescope find_files'
