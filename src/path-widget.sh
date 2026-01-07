#!/usr/bin/env bash

# check if enabled
ENABLED=$(tmux show-option -gv @jellybeans-tmux_show_path 2>/dev/null)
[[ ${ENABLED} -ne 1 ]] && exit 0

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

PATH_FORMAT=$(tmux show-option -gv @jellybeans-tmux_path_format 2>/dev/null) # full | relative
# Teal text to match lualine style
RESET="#[fg=#2DA099,bg=#1c1b1a,nobold,noitalics,nounderscore,nodim]"

current_path="${1}"
default_path_format="relative"
PATH_FORMAT="${PATH_FORMAT:-$default_path_format}"

# check user requested format
if [[ ${PATH_FORMAT} == "relative" ]]; then
  current_path="$(echo ${current_path} | sed 's#'"$HOME"'#~#g')"
fi

# Powerline pill with folder icon
echo "#[fg=#1c1b1a,bg=#100f0f]#[fg=#8197bf,bg=#1c1b1a]   ${RESET}${current_path} #[fg=#1c1b1a,bg=#100f0f]"
