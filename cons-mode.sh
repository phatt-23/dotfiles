#!/usr/bin/env bash

CURRENT_MODE=$(< /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)


if [ "$CURRENT_MODE" == 0 ]; then
    echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
    echo "Conservation Mode turned ON :)" 
else
    echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
    echo "Conservation Mode turned OFF :)" 
fi
