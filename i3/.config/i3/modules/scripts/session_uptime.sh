#!/bin/env bash

has_day=$(uptime | grep day)

if [ "$has_day" ]; then
    echo $(uptime | awk -F'( |,|:)+' '{print $6"d " $8 "h"}')
else
    echo $(uptime | awk -F'( |,|:)+' '{print $2"h "$3"m "}')
fi

