#!/bin/bash
# Claude Code status line.
#   Line 1: herdr workspace (or cwd), git branch + status, model, effort
#           (the chezmoi source repo's branch in chezmoi-managed directories)
#   Line 2: context window, 5-hour and weekly quota bars
input=$(cat)

IFS=$'\x1f' read -r model effort dir ctx_pct ctx_used ctx_size five_pct five_reset week_pct week_reset < <(
  jq -r '[
    .model.display_name,
    (.effort.level // ""),
    .workspace.current_dir,
    (.context_window.used_percentage // ""),
    (.context_window.current_usage
      | if . == null then "" else
          (.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)
        end),
    (.context_window.context_window_size // 200000),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.five_hour.resets_at // ""),
    (.rate_limits.seven_day.used_percentage // ""),
    (.rate_limits.seven_day.resets_at // "")
  ] | map(tostring) | join("\u001f")' <<<"$input"
)

dim='\033[2m' reset='\033[0m'
# Line 1 colours use the terminal's ANSI palette, matching the tmux status bar.
c_model='\033[1;34m' c_effort='\033[35m' c_location='\033[36m' c_branch='\033[33m'
c_staged='\033[32m' c_modified='\033[33m' c_untracked='\033[35m' c_conflict='\033[31m' c_sync='\033[36m'
icon_dir=$''       # nf-fa-folder
icon_project=$''   # nf-fa-briefcase
icon_branch=$''    # nf-dev-git_branch
icon_chezmoi=$'\uf015'   # nf-fa-home
icon_staged=$'\uf00c'    # nf-fa-check
icon_modified=$'\uf040'  # nf-fa-pencil
icon_untracked=$'\uf128' # nf-fa-question
icon_conflict=$'\uf071'  # nf-fa-warning
icon_ahead=$'\uf062'     # nf-fa-arrow_up
icon_behind=$'\uf063'    # nf-fa-arrow_down

# --- Line 1 ------------------------------------------------------------------
location=""
if [ "${HERDR_ENV:-}" = 1 ] && [ -n "${HERDR_WORKSPACE_ID:-}" ]; then
  location=$("${HERDR_BIN_PATH:-herdr}" workspace get "$HERDR_WORKSPACE_ID" 2>/dev/null |
    jq -r '.result.workspace.label // empty' 2>/dev/null)
  [ -n "$location" ] && location="$icon_project $location"
fi
[ -n "$location" ] || location="$icon_dir ${dir/#$HOME/\~}"

# Use the directory's own repo; failing that, if chezmoi manages the directory,
# report on the chezmoi source repo instead.
repo="" repo_icon=$icon_branch
if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  repo=$dir
elif command -v chezmoi >/dev/null && src=$(chezmoi source-path "$dir" 2>/dev/null); then
  repo=$src repo_icon="$icon_chezmoi $icon_branch"
fi

git_info=""
if [ -n "$repo" ]; then
  # One porcelain v2 call gives branch, ahead/behind and per-file states.
  read -r branch ahead behind staged modified untracked conflicts < <(
    git -C "$repo" --no-optional-locks status --porcelain=v2 --branch 2>/dev/null | awk '
      /^# branch.head / { head = $3 }
      /^# branch.oid /  { oid = substr($3, 1, 7) }
      /^# branch.ab /   { ahead = substr($3, 2); behind = substr($4, 2) }
      /^[12] / { if (substr($2, 1, 1) != ".") s++; if (substr($2, 2, 1) != ".") m++ }
      /^u /    { c++ }
      /^\? /   { u++ }
      END {
        if (head == "(detached)") head = oid
        print head, ahead + 0, behind + 0, s + 0, m + 0, u + 0, c + 0
      }'
  )
  if [ -n "$branch" ]; then
    git_info="${c_branch}$repo_icon $branch${reset}"
    [ "$ahead" -gt 0 ]     && git_info+=" ${c_sync}$icon_ahead$ahead${reset}"
    [ "$behind" -gt 0 ]    && git_info+=" ${c_sync}$icon_behind$behind${reset}"
    [ "$conflicts" -gt 0 ] && git_info+=" ${c_conflict}$icon_conflict $conflicts${reset}"
    [ "$staged" -gt 0 ]    && git_info+=" ${c_staged}$icon_staged $staged${reset}"
    [ "$modified" -gt 0 ]  && git_info+=" ${c_modified}$icon_modified $modified${reset}"
    [ "$untracked" -gt 0 ] && git_info+=" ${c_untracked}$icon_untracked $untracked${reset}"
  fi
fi

printf "${c_location}%s${reset}" "$location"
[ -n "$git_info" ] && printf "  %b" "$git_info"
printf "  ${c_model}%s${reset}" "$model"
[ -n "$effort" ] && printf " ${c_effort}%s${reset}" "$effort"

# --- Line 2 ------------------------------------------------------------------
width=${CLAUDE_STATUS_BAR_WIDTH:-10}

# bar <label> <percent> [detail]: green under 50%, yellow 50-79%, red 80%+
bar() {
  local label=$1 pct=${2%%.*} detail=${3:-} color on='' off='' filled i
  [ "$pct" -gt 100 ] && pct=100
  filled=$(( pct * width / 100 ))
  if   [ "$pct" -ge 80 ]; then color='\033[31m'
  elif [ "$pct" -ge 50 ]; then color='\033[33m'
  else                         color='\033[32m'
  fi
  for ((i = 0; i < filled; i++)); do on+='█'; done
  for ((i = filled; i < width; i++)); do off+='░'; done
  printf "${dim}%s${reset} ${color}%s${reset}${dim}%s${reset} " "$label" "$on" "$off"
  [ -n "$detail" ] && printf "${dim}%s${reset} " "$detail"
  printf "${color}%d%%${reset}" "$pct"
}

# Quotas are account-wide but only reported after a session's first response,
# so remember the last values and reuse them until their window resets.
cache="${XDG_CACHE_HOME:-$HOME/.cache}/claude-statusline/quota"
now=$(date +%s)
if [ -n "$five_pct$week_pct" ]; then
  mkdir -p "${cache%/*}"
  [ -r "$cache" ] && read -r c5 c5r cw cwr <"$cache"
  [ -n "$five_pct" ] && c5=$five_pct c5r=$five_reset
  [ -n "$week_pct" ] && cw=$week_pct cwr=$week_reset
  printf '%s %s %s %s\n' "${c5:--}" "${c5r:-0}" "${cw:--}" "${cwr:-0}" >"$cache"
elif [ -r "$cache" ]; then
  read -r c5 c5r cw cwr <"$cache"
  [ "$c5" != - ] && [ "${c5r:-0}" -gt "$now" ] && five_pct=$c5
  [ "$cw" != - ] && [ "${cwr:-0}" -gt "$now" ] && week_pct=$cw
fi

# Before the first response there is no usage yet; show the bars empty.
detail=""
[ -n "$ctx_used" ] && detail="$(( ctx_used / 1000 ))k/$(( ctx_size / 1000 ))k"
segments=(
  "$(bar ctx "${ctx_pct:-0}" "$detail")"
  "$(bar 5h "${five_pct:-0}")"
  "$(bar wk "${week_pct:-0}")"
)

if [ ${#segments[@]} -gt 0 ]; then
  # Lines are trimmed by the renderer, so no indent.
  printf "\n${dim}└${reset} "
  sep=""
  for s in "${segments[@]}"; do
    printf "%s%s" "$sep" "$s"
    sep="  "
  done
fi
