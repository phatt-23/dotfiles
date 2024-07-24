#!/bin/env bash

uptime=$(uptime --pretty| cut -c 3-)
echo $uptime
