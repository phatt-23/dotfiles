#!/bin/bash

# Check if player is playing
if [ $(playerctl status) == "Paused" ]; then
    # If not playing, play
    playerctl play
    echo "INFO: Media Play"
else
    # If playing, pause
    playerctl pause
    echo "INFO: Media Pause"
fi

