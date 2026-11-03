#!/bin/bash
# Toggle the hyprsunset blue-light filter on/off.

STATE="${XDG_RUNTIME_DIR:-/tmp}/hyprsunset-nightlight"

if [ -f "$STATE" ]; then
    hyprctl hyprsunset identity >/dev/null 2>&1
    rm -f "$STATE"
    notify-send -u low "Night light" "Off"
else
    hyprctl hyprsunset temperature 3500 >/dev/null 2>&1
    touch "$STATE"
    notify-send -u low "Night light" "On (3500K)"
fi
