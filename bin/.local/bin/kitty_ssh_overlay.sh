#!/usr/bin/env bash
server=$(grep -E '^Host ' ~/.ssh/config | awk '{print $2}' | fzf)

if [[ -n $server ]]; then
  if [[ "$server" =~ ^sw-.* ]]; then
    kitten @ launch --type=tab --tab-title="SSH: $server" ssh $server
  else
    kitten @ launch --type=tab --tab-title="SSH: $server" kitten ssh $server
  fi
fi
