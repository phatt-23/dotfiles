#!/usr/bin/env bash

# Define an associative array:
typeset -A mode
# And its content:
mode=(
  [single]="autorandr hdmi_mon"
  [extended]="autorandr horizontal-reverse"
  [mirror]="autorandr mirror "
  [rotate_right_hdmi0]="xrandr --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate right"
)

mode_nrows=${#mode[@]}
font="Fira Code Retina 12"
selected="$(printf '%s\n' "${!mode[@]}" | sort | rofi -dmenu -font "$font" -p "monitor" -i -lines 2)"
i3-msg -q "exec --no-startup-id ${mode[${selected}]}"
