#!/usr/bin/env bash

brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)

brightness_percentage=$(echo "scale=2; ($brightness / $max_brightness) * 100" | bc)

{
    printf "%.0f%%\n" "$brightness_percentage"
} > $HOME/.config/i3/modules/i3/bar/logs/backlight.log

