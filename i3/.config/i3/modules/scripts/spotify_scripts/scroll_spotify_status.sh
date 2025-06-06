#!/bin/bash

# see man zscroll for documentation of the following parameters

zscroll -l 30 \
        --delay 1.0 \
        --match-command "`dirname $0`/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_spotify_status.sh" \
        --always-reprint ALWAYS_REPRINT\
        > ~/.config/i3/modules/logs/spotify.log &


wait

