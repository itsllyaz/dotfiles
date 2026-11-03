#!/bin/zsh

# Waybar is managed by the systemd user service (waybar.service).
# Restart it through systemd so we never end up with two bars.
systemctl --user restart waybar.service

killall -9 swaync
swaync &
