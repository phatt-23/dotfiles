#!/bin/bash 

# cpupower frequency-set -g conservative
cpupower frequency-set -g powersave
# cpupower frequency-set --max 1.6GHz

for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
  sudo cpupower -c "${cpu##*cpu}" frequency-set -u 2.0GHz
done
