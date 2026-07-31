#!/bin/bash

pkill -x waybar

# Wait for it to actually exit instead of guessing with a fixed sleep
for _ in {1..40}; do
    pgrep -x waybar >/dev/null || break
    sleep 0.05
done

waybar &

# -x so "swaync" doesn't also match swaync-client
if pgrep -x swaync >/dev/null; then
    swaync-client --reload-config
    swaync-client --reload-css
else
    swaync &
fi
