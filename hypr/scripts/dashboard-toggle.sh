#!/bin/bash
# Toggle the Quickshell dashboard, starting it first if it isn't running.

if ! qs -c dashboard ipc show >/dev/null 2>&1; then
    setsid qs -c dashboard >/dev/null 2>&1 &
    for _ in $(seq 1 30); do
        qs -c dashboard ipc show >/dev/null 2>&1 && break
        sleep 0.1
    done
fi

qs -c dashboard ipc call dashboard toggle
