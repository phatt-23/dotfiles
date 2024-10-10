#!/usr/bin/env sh

log_path=$HOME/.config/i3/modules/logs/cpu_temperature.log
temerature=$(cpu_temperature.sh)
temerature_previous=$(cat $log_path)

if [ "$temerature_previous" == "$temerature" ]; then
    exit 0
fi

echo $temerature > $log_path

# PID=$(pgrep i3status)
# kill -SIGUSR1 $PID

exit 0
