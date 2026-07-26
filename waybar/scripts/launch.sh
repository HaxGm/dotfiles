#!/bin/bash

# -x so "swaync" doesn't also match swaync-client
pkill -x waybar
pkill -x swaync

# Wait for them to actually exit instead of guessing with a fixed sleep
for _ in {1..40}; do
    pgrep -x waybar >/dev/null || pgrep -x swaync >/dev/null || break
    sleep 0.05
done

waybar &
swaync &
