#!/bin/bash

PINNED=1-5,7-11
UNPINNED=0,6

# Isolate the Core Unpinned
systemctl set-property --runtime -- user.slice AllowedCPUs=$UNPINNED
systemctl set-property --runtime -- system.slice AllowedCPUs=$UNPINNED
systemctl set-property --runtime -- init.scope AllowedCPUs=$UNPINNED

# Shielding the Pinned Cores
cset shield --kthread=on --cpu=$PINNED

# Setting min turbo perf to 40
echo 40 > /sys/devices/system/cpu/intel_pstate/min_perf_pct

# Setting Governor to Perfomance
cpupower -c all frequency-set -g performance

# Map VFIO interrupts to pinned cores
grep -e vfio  /proc/interrupts | cut -d: -f1 | tr -d ' ' | grep -E '^[0-9]+$' | while read int; do
		echo $PINNED > /proc/irq/$int/smp_affinity_list
done

# Map other interrupts to host cores
grep -ve vfio /proc/interrupts | cut -d: -f1 | tr -d ' ' | grep -E '^[0-9]+$' | while read int; do
		echo $UNPINNED > /proc/irq/$int/smp_affinity_list || true
done

