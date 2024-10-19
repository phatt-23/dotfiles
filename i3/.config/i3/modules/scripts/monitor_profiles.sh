#!/usr/bin/env bash

# Command fixing screen tearing
tear_free_hdmi="xrandr --output HDMI-A-0 --set "TearFree" on"
tear_free_edp="xrandr --output eDP --set "TearFree" on"
tear_free_all="$tear_free_hdmi && $tear_free_edp"

# Commands changing monitor profiles
single_monitor="autorandr hdmi_mon"
extended="autorandr horizontal-reverse"
mirror="autorandr mirror"
right_rotate_hdmi="xrandr --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate right"
right_rotate_edp="xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate right"

# Define an associative array:
typeset -A mode

# And its content:
mode=(
    [no_tear]="$tear_free_all"
    [single]="$single_monitor && $tear_free_all"
    [extended]="$extended && $tear_free_all"
    [mirror]="$mirror && $tear_free_all"
    [rotate_right_hdmi0]="$right_rotate_hdmi && $tear_free_all"
    [rotate_right_edp]="$right_rotate_edp && $tear_free_all"
)

mode_nrows=${#mode[@]}

selected="$(printf '%s\n' "${!mode[@]}" | sort | rofi -dmenu -font "$font" -p "monitor" -i -lines 2)"

i3-msg -q "exec --no-startup-id ${mode[${selected}]}"

