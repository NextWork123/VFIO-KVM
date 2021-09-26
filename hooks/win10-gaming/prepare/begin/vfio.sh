#!/bin/bash
set -x

#Terminate sessions safely
loginctl terminate-user #username (need to be replaced with your nickname)
sleep 2

# Stop Simple Desktop Display Manager
systemctl stop sddm.service
sleep 1

# Isolate Multi-User
systemctl isolate multi-user.target
sleep 1

# Unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind
sleep 3
