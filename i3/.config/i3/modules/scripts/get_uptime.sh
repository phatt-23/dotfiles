#!/bin/env bash

log_path=$HOME/.config/i3/modules/logs/uptime.log
uptime=$(session_uptime.sh)
uptime_previous=$(cat $log_path)

if [ "$uptime" == "$uptime_previous" ]; then
    exit 0
fi

echo $uptime > $log_path

# PID=$(pgrep i3status)
# kill -SIGUSR1 $PID

exit 0
