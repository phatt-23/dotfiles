#!/usr/bin/env bash

# Define an associative array:
typeset -A mode
# And its content:
mode=(
  [external/HDMI-A-0]="HDMI-A-0"
  [laptop/eDP]="eDP"
)

mode_nrows=${#mode[@]}
selected="$(printf '%s\n' "${!mode[@]}" | sort | rofi -dmenu -font "$font" -p "monitor" -i -lines 2)"
current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d "\"" -f2)
i3-msg "workspace $current_workspace, move workspace to output ${mode[${selected}]}"
