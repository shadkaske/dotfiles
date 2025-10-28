#!/usr/bin/env bash
tmux new-window -c '#{pane_current_path}' './vendor/bin/sail down && ./vendor/bin/sail up'
sleep 2
tmux split-window -c '#{pane_current_path}' -v ./vendor/bin/sail yarn run watch-poll
tmux split-window -c '#{pane_current_path}' -v ./vendor/bin/sail artisan queue:listen --queue=evo_linearRfid,frameRfid,moldingRfid,default,sbmRfid,tagnetBackfill --sleep=1 --tries=1 --timeout=600
tmux split-window -c '#{pane_current_path}' -v ./vendor/bin/sail artisan pail --timeout 0
tmux select-window -t 1
nvim
