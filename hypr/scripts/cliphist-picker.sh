#!/bin/bash
# Pick an entry from clipboard history and put it back on the clipboard.

selected=$(cliphist list | rofi -dmenu -p "Clipboard" -config "$HOME/.config/rofi/config.rasi")
[ -z "$selected" ] && exit 0

printf '%s' "$selected" | cliphist decode | wl-copy
