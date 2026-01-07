#!/usr/bin/env bash
# Jellybeans-Flexoki theme - single variant
# Jellybeans colors with Flexoki's inky black background

TRANSPARENT_THEME="$(tmux show-option -gv @jellybeans-tmux_transparent)"

# Jellybeans-Flexoki color palette
declare -A THEME=(
  # Backgrounds (Flexoki)
  ["background"]="#100f0f"

  # Foreground (Jellybeans)
  ["foreground"]="#e8e8d3"

  # Standard colors (Jellybeans)
  ["black"]="#101010"
  ["blue"]="#8197bf"
  ["cyan"]="#2B5B77"
  ["green"]="#99ad6a"
  ["magenta"]="#c6b6ee"
  ["red"]="#B05050"
  ["white"]="#c7c7c7"
  ["yellow"]="#dad085"

  # Bright variants
  ["bblack"]="#1c1b1a"
  ["bblue"]="#8fbfdc"
  ["bcyan"]="#668799"
  ["bgreen"]="#99ad6a"
  ["bmagenta"]="#c6b6ee"
  ["bred"]="#cf6a4c"
  ["bwhite"]="#ffffff"
  ["byellow"]="#ffb964"
)

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

# Git status colors (adapted for jellybeans)
THEME['ghgreen']="#99ad6a"
THEME['ghmagenta']="#c6b6ee"
THEME['ghred']="#B05050"
THEME['ghyellow']="#dad085"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
