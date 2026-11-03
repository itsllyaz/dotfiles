#!/bin/bash
# Restore the last selected wallpaper once swww-daemon is ready.

WALL="$HOME/.config/hypr/current_wallpaper"
[ -f "$WALL" ] || exit 0

for _ in $(seq 1 20); do
    swww query >/dev/null 2>&1 && break
    sleep 0.2
done

swww img "$WALL" --transition-type any --transition-duration 1
