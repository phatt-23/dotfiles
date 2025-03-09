#!/usr/bin/env bash

# CURRENT_MODE=$(< /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
#
#
# if [ "$CURRENT_MODE" == 0 ]; then
#     echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
#     echo "Conservation Mode turned ON :)" 
# else
#     echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
#     echo "Conservation Mode turned OFF :)" 
# fi

CURRENT_STOP_THRESH=$(< /sys/class/power_supply/BAT0/charge_stop_threshold)

if [ "$CURRENT_STOP_THRESH" == 100 ]; then
    echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold
    echo 75 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
    echo "Conservation Mode turned ON :)"
else
    echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold
    echo 95 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
    echo "Conservation Mode turned OFF :)" 
fi
