#!/bin/env bash

uptime=$(uptime | awk -F'( |,|:)+' '{print $6"d",$8"h",$9"m"}')
echo $uptime
