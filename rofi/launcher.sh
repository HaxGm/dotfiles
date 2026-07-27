#!/usr/bin/env bash
#
# Toggle the app launcher: pressing the bind again while rofi is up closes it
# instead of stacking a second instance.

# Resolve through the ~/.config/rofi symlink to wherever this repo lives.
dir="$(dirname "$(readlink -f "$0")")"

pkill -x rofi || exec rofi -show drun -theme "$dir/style.rasi"
