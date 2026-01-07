#!/usr/bin/env bash

# Check if enabled
ENABLED=$(tmux show-option -gv @jellybeans-tmux_show_git)
[[ ${ENABLED} -ne 1 ]] && exit 0

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/../lib/coreutils-compat.sh"
source "$CURRENT_DIR/themes.sh"

cd "$1" || exit 1
RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -cE "^(M| M)")

SYNC_MODE=0
NEED_PUSH=0

if [[ ${#BRANCH} -gt 25 ]]; then
  BRANCH="${BRANCH:0:25}…"
fi

STATUS_CHANGED=""
STATUS_INSERTIONS=""
STATUS_DELETIONS=""
STATUS_UNTRACKED=""

if [[ $STATUS -ne 0 ]]; then
  DIFF_COUNTS=($(git diff --numstat 2>/dev/null | awk 'NF==3 {changed+=1; ins+=$1; del+=$2} END {printf("%d %d %d", changed, ins, del)}'))
  CHANGED_COUNT=${DIFF_COUNTS[0]}
  INSERTIONS_COUNT=${DIFF_COUNTS[1]}
  DELETIONS_COUNT=${DIFF_COUNTS[2]}

  SYNC_MODE=1
fi

UNTRACKED_COUNT="$(git ls-files --other --exclude-standard | wc -l | bc)"

if [[ $CHANGED_COUNT -gt 0 ]]; then
  STATUS_CHANGED="#[fg=${THEME[yellow]},bg=${THEME[bblack]},bold]  ${CHANGED_COUNT} "
fi

if [[ $INSERTIONS_COUNT -gt 0 ]]; then
  STATUS_INSERTIONS="#[fg=${THEME[green]},bg=${THEME[bblack]},bold]  ${INSERTIONS_COUNT} "
fi

if [[ $DELETIONS_COUNT -gt 0 ]]; then
  STATUS_DELETIONS="#[fg=${THEME[red]},bg=${THEME[bblack]},bold]  ${DELETIONS_COUNT} "
fi

if [[ $UNTRACKED_COUNT -gt 0 ]]; then
  STATUS_UNTRACKED="#[fg=${THEME[white]},bg=${THEME[bblack]},bold]  ${UNTRACKED_COUNT} "
fi

# Determine repository sync status
if [[ $SYNC_MODE -eq 0 ]]; then
  NEED_PUSH=$(git log @{push}.. 2>/dev/null | wc -l | bc)
  if [[ $NEED_PUSH -gt 0 ]]; then
    SYNC_MODE=2
  fi
fi

# Set the status indicator based on the sync mode (powerline pill style)
PILL_START="#[fg=${THEME[bblack]},bg=${THEME[background]}]"
PILL_END="#[fg=${THEME[bblack]},bg=${THEME[background]}]"

# Git branch icon:  (U+E0A0)
case "$SYNC_MODE" in
1)
  # Local changes - orange branch icon
  REMOTE_ICON="#[fg=${THEME[bred]},bg=${THEME[bblack]},bold] "
  ;;
2)
  # Needs push - red upload icon
  REMOTE_ICON="#[fg=${THEME[red]},bg=${THEME[bblack]},bold] 󰛃"
  ;;
3)
  # Remote ahead - magenta download icon
  REMOTE_ICON="#[fg=${THEME[magenta]},bg=${THEME[bblack]},bold] 󰛀"
  ;;
*)
  # Synced - green branch icon
  REMOTE_ICON="#[fg=${THEME[green]},bg=${THEME[bblack]},bold] "
  ;;
esac

if [[ -n $BRANCH ]]; then
  # Teal text for branch name to match lualine style
  echo "${PILL_START}${REMOTE_ICON} #[fg=#2DA099,bg=${THEME[bblack]},nobold]$BRANCH $STATUS_CHANGED$STATUS_INSERTIONS$STATUS_DELETIONS$STATUS_UNTRACKED${PILL_END}"
fi
