#!/usr/bin/env bash

brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)

brightness_percentage=$(echo "scale=2; ($brightness / $max_brightness) * 100" | bc)

backlight=$(printf "%.0f%%\n" "$brightness_percentage")
backlight_previous=$(cat $HOME/.config/i3/modules/logs/backlight.log)

# echo $backlight 
# echo $backlight_previous

if [ "$backlight" == "$backlight_previous" ]; then
    exit 0
fi

echo $backlight > $HOME/.config/i3/modules/logs/backlight.log

# PID=$(pgrep i3status)
# kill -SIGUSR1 $PID

exit 0




