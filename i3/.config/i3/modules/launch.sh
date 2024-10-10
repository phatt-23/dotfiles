#!/bin/env bash

kill $(< /tmp/i3status_launch_script_process_id)
echo $$ > /tmp/i3status_launch_script_process_id

while [[ 1 ]]; do
    #uptime
    echo $(session_uptime.sh) > $HOME/.config/i3/modules/logs/uptime.log

    #temperature
    echo $(cpu_temperature.sh) > $HOME/.config/i3/modules/logs/cpu_temperature.log

    #brightness
    brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
    max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
    brightness_percentage=$(echo "scale=2; ($brightness / $max_brightness) * 100" | bc)
    backlight=$(printf "%.0f%%\n" "$brightness_percentage")
    echo $backlight > $HOME/.config/i3/modules/logs/backlight.log

    #keyboard
    log_path=$HOME/.config/i3/modules/logs/keyboard_layout.log
    layout=$(keyboard_layout.sh)
    echo $layout > $log_path
    $HOME/.config/i3/modules/scripts/get_keyboard_layout.sh
    
    #get the process id if not already
    if [ "$PID" == "" ]; then
        PID=$(pgrep i3status)
    fi

    #update the i3status
    kill -SIGUSR1 $PID
    
    sleep 1
done



