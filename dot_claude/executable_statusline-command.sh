#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
dir=$(echo "$input" | jq -r '.workspace.current_dir')
transcript=$(echo "$input" | jq -r '.transcript_path // ""')

# Show ~ for home directory
display_dir="${dir/#$HOME/\~}"

branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)

# Context usage: tokens sent on the most recent main-thread request.
# Sidechain (subagent) entries are excluded; they have their own context.
limit=${CLAUDE_CONTEXT_LIMIT:-200000}
width=${CLAUDE_CONTEXT_BAR_WIDTH:-24}
used=0
if [ -n "$transcript" ] && [ -r "$transcript" ]; then
  # Only the tail is scanned, so huge transcripts stay fast.
  used=$(tail -n 200 "$transcript" 2>/dev/null | jq -s -r '
    [ .[]
      | select(.isSidechain != true)
      | select(.message.usage != null)
      | .message.usage
      | (.input_tokens // 0)
        + (.cache_creation_input_tokens // 0)
        + (.cache_read_input_tokens // 0)
    ] | last // 0
  ' 2>/dev/null)
  [ -n "$used" ] || used=0
fi

# Line 1: model, directory, branch
printf '\033[2m%s\033[0m \033[2m%s\033[0m' "$model" "$display_dir"
if [ -n "$branch" ]; then
  printf ' \033[2m(%s)\033[0m' "$branch"
fi

# Line 2: context usage bar. Lines are trimmed by the renderer, so no indent.
if [ "$used" -gt 0 ] 2>/dev/null; then
  pct=$(( used * 100 / limit ))
  [ "$pct" -gt 100 ] && pct=100
  filled=$(( pct * width / 100 ))
  [ "$filled" -gt "$width" ] && filled=$width

  # green under 50%, yellow 50-79%, red 80%+
  if   [ "$pct" -ge 80 ]; then color='\033[31m'
  elif [ "$pct" -ge 50 ]; then color='\033[33m'
  else                         color='\033[32m'
  fi

  bar_on=''; bar_off=''
  for ((i = 0; i < filled; i++)); do bar_on+='█'; done
  for ((i = filled; i < width; i++)); do bar_off+='░'; done

  printf '\n'
  printf '\033[2m\342\224\224 \033[0m'
  printf "$color"'%s\033[0m\033[2m%s\033[0m' "$bar_on" "$bar_off"
  printf ' \033[2m%dk/%dk\033[0m '"$color"'%d%%\033[0m' \
    "$(( used / 1000 ))" "$(( limit / 1000 ))" "$pct"
fi
