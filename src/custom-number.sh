#!/usr/bin/env bash

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

# Use arrays to properly handle multi-byte UTF-8 characters
format_hide=()
format_none=(0 1 2 3 4 5 6 7 8 9)
format_digital=(🯰 🯱 🯲 🯳 🯴 🯵 🯶 🯷 🯸 🯹)
format_fsquare=(󰎡 󰎤 󰎧 󰎪 󰎭 󰎱 󰎳 󰎶 󰎹 󰎼)
format_hsquare=(󰎣 󰎦 󰎩 󰎬 󰎮 󰎰 󰎵 󰎸 󰎻 󰎾)
format_dsquare=(󰎢 󰎥 󰎨 󰎫 󰎲 󰎯 󰎴 󰎷 󰎺 󰎽)
format_roman=(" " 󱂈 󱂉 󱂊 󱂋 󱂌 󱂍 󱂎 󱂏 󱂐)
format_super=(⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹)
format_sub=(₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉)

ID=$1
FORMAT=${2:-none}

if [ "$FORMAT" = "hide" ]; then
  exit 0
fi

# Get the format array by name
declare -n format="format_${FORMAT}" 2>/dev/null
if [ ${#format[@]} -eq 0 ]; then
  echo "Invalid format: $FORMAT"
  exit 1
fi

# If format is roman numerals, only handle IDs of 1 digit
if [ "$FORMAT" = "roman" ] && [ ${#ID} -gt 1 ]; then
  echo -n "$ID "
else
  for ((i = 0; i < ${#ID}; i++)); do
    DIGIT=${ID:i:1}
    echo -n "${format[$DIGIT]} "
  done
fi
