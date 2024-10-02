#!/usr/bin/env bash

# kill $(cat /tmp/i3status_launch_script_process_id)
cat /tmp/i3status_launch_script_process_id | xargs kill
echo $$ > /tmp/i3status_launch_script_process_id

while [[ 1 ]]; do
    $HOME/.config/i3/modules/i3/bar/scripts/get_uptime.sh &
    $HOME/.config/i3/modules/i3/bar/scripts/get_cpu_temprature.sh &
    $HOME/.config/i3/modules/i3/bar/scripts/get_backlight.sh &
    $HOME/.config/i3/modules/i3/bar/scripts/get_keyboard_layout.sh &
    sleep 1
done



