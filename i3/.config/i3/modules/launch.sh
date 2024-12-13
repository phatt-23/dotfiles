#!/bin/env bash

kill $(< /tmp/i3status_launch_script_process_id)
echo $$ > /tmp/i3status_launch_script_process_id

while [[ 1 ]]; do

    #uptime
    echo $($HOME/.config/i3/modules/scripts/session_uptime.sh) \
        > $HOME/.config/i3/modules/logs/uptime.log

    #temperature
    echo $(sensors | grep "Tctl" | tr -d '+' | awk '{print $2}') \
        > $HOME/.config/i3/modules/logs/cpu_temperature.log

    #brightness
    brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
    max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
    brightness_percentage=$(echo "scale=2; ($brightness / $max_brightness) * 100" | bc)
    backlight=$(printf "%.0f%%\n" "$brightness_percentage")
    echo $backlight > $HOME/.config/i3/modules/logs/backlight.log

    #keyboard
    keyboard=$($HOME/.config/i3/modules/scripts/get_keyboard_layout.sh) 
    echo $keyboard > $HOME/.config/i3/modules/logs/keyboard_layout.log 
    
    #spotify
    spotify=$($HOME/.config/i3/modules/scripts/spotify_scripts/get_spotify_status.sh)
    echo $spotify > $HOME/.config/i3/modules/logs/spotify.log

    #get the process id if not already
    if [ "$PID" == "" ]; then
        PID=$(pgrep i3status)
    fi

    #update the i3status
    kill -SIGUSR1 $PID
    
    sleep 1
done



