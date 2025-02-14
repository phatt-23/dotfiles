#!/bin/sh

COMMAND=$(xset -q | grep LED | awk '{ print $10 }')
log_path=$HOME/.config/i3/modules/logs/keyboard_layout.log

case "$COMMAND" in

 "00000000"|"00000001") LAYOUT="US" ;;

 "00001000"|"00001001") LAYOUT="CZ" ;;

  *) LAYOUT="??" ;;

esac

echo $LAYOUT 

exit 0
