#!/bin/env bash

log_path=$HOME/.config/i3/modules/logs/uptime.log
uptime=$(uptime --pretty)
uptime_previous=$(cat $log_path)

if [ "$uptime" == "$uptime_previous" ]; then
    echo "the same wtf"
    echo $uptime
    echo $uptime_previous
    exit 0
fi

echo $uptime > $log_path
echo $uptime

# PID=$(pgrep i3status)
# kill -SIGUSR1 $PID

exit 0
