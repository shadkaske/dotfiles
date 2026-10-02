#!/usr/bin/env bash
# Print concrete Host aliases from ~/.ssh/config (and any Include'd files),
# skipping wildcard patterns and negations.
set -uo pipefail

ssh_dir="$HOME/.ssh"

parse() {
  local file=$1 key rest pattern inc f
  local -a patterns
  [[ -r $file ]] || return 0
  while read -r key rest; do
    case "${key,,}" in
      host)
        read -ra patterns <<<"$rest"
        for pattern in "${patterns[@]}"; do
          [[ $pattern == *[\*\?\!]* ]] && continue
          printf '%s\n' "$pattern"
        done
        ;;
      include)
        for inc in $rest; do
          [[ $inc == ~* ]] && inc="$HOME${inc#\~}"
          [[ $inc == /* ]] || inc="$ssh_dir/$inc"
          for f in $inc; do parse "$f"; done
        done
        ;;
    esac
  done < <(sed -E 's/^[[:space:]]+//; s/#.*//; s/^([A-Za-z]+)[[:space:]]*=[[:space:]]*/\1 /' "$file")
}

parse "$ssh_dir/config" | awk '!seen[$0]++'
