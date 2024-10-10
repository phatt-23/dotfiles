#!/usr/bin/env sh

log_path=$HOME/.config/i3/modules/logs/keyboard_layout.log
layout=$(keyboard_layout.sh)
layout_previous=$(cat $log_path)

if [ "$layout" == "$layout_previous" ]; then
    exit 0
fi

echo $layout > $log_path

# PID=$(pgrep i3status)
# kill -SIGUSR1 $PID

exit 0
