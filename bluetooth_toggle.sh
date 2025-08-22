#!/bin/bash

DEVICE="XX:XX:XX:XX:XX:XX"

STATUS=$(bluetoothctl info "$DEVICE" | grep "Connected: yes")

if [ -n "$STATUS" ]; then
    echo -e "disconnect $DEVICE\nexit" | bluetoothctl
    notify-send "Bluetooth" "Disconnected from device"
else
    rfkill unblock bluetooth
    bluetoothctl power on
    echo -e "connect $DEVICE\nexit" | bluetoothctl
    notify-send "Bluetooth" "Connected to device"
fi

