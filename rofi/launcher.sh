#!/usr/bin/env bash
#
# Toggle the app launcher: pressing the bind again while rofi is up closes it
# instead of stacking a second instance.

# Resolve through the ~/.config/rofi symlink to wherever this repo lives.
dir="$(dirname "$(readlink -f "$0")")"


pidfile="${XDG_RUNTIME_DIR:-/tmp}/rofi-launcher.pid"

if [[ -r "$pidfile" ]] && read -r pid <"$pidfile" && kill -0 "$pid" 2>/dev/null; then
    kill "$pid"
    exit 0
fi

echo $$ >"$pidfile"
exec rofi -show drun -theme "$dir/style.rasi"
