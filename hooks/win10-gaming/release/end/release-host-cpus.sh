#!/bin/bash

# Release all cores
systemctl set-property --runtime -- user.slice AllowedCPUs=0-11
systemctl set-property --runtime -- system.slice AllowedCPUs=0-11
systemctl set-property --runtime -- init.scope AllowedCPUs=0-11

# Reset the cset shield
cset shield --reset
cset set -d machine

# Setting min turbo perf to 16 (default)
echo 16 > /sys/devices/system/cpu/intel_pstate/min_perf_pct

# set governor to powersave
cpupower -c all frequency-set -g powersave
