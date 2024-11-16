#!/bin/env bash

has_hour=$(uptime --pretty | grep hour)
has_day=$(uptime --pretty | grep day)

# Check if has_hour is empty
if [ -z "$has_day" ]; then
    if [ -z "$has_hour" ]; then
        echo $(uptime | awk -F'( |,|:)+' '{print "0h " $6 "m"}')
    else
        echo $(uptime | awk -F'( |,|:)+' '{print $6 "h " $7 "m"}')
    fi
else
    if [ -z "$has_hour" ]; then
        echo $(uptime | awk -F'( |,|:)+' '{print $6 "d 0h " $8 "m"}')
    else
        echo $(uptime | awk -F'( |,|:)+' '{print $6 "d " $8 "h " $9 "m "}')
    fi
fi

