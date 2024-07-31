#!/usr/bin/env bash
font="Fira Code Retina 12"
if [ -n "$1" ]; then
    all_sources=$(pactl list short sources | cut -f 2)
    default_source=$(pactl get-default-source)
    active_source=$(echo "$all_sources" | grep -n $default_source | cut -d : -f 1)

    selected_source=$(echo "$all_sources" | rofi -dmenu -font "$font" -i -p 'Audio setup' -a $(($active_source - 1)))
    pactl set-default-source $selected_source
else
    all_sinks=$(pactl list short sinks | cut -f 2)
    default_sink=$(pactl get-default-sink)
    active_sink=$(echo "$all_sinks" | grep -n $default_sink | cut -d : -f 1)

    selected_sink=$(echo "$all_sinks" | rofi -dmenu -font "$font" -i -a -p 'audio' $(($active_sink - 1)))
    pactl set-default-sink $selected_sink
fi
