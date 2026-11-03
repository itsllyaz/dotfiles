#!/bin/bash
# Store clipboard changes (text + images) in cliphist.
# Started by the cliphist-watch systemd user service.

wl-paste --type text  --watch cliphist store &
wl-paste --type image --watch cliphist store &

wait
