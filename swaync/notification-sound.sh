#!/usr/bin/env bash

# Resolve through the ~/.config/swaync symlink to wherever this repo actually
# lives, so the sound is found no matter where it's checked out.
sound="$(dirname "$(readlink -f "$0")")/notification.ogg"

# The sound file is not in the repo — drop your own in next to this script.
# Exit quietly if it isn't there: config.json has script-fail-notify enabled and
# fires this script for every notification, so a non-zero exit would notify
# about the failure, which would run the script again.
[ -f "$sound" ] || exit 0

if [ "$(swaync-client --get-dnd)" = "false" ]; then
  pw-play "$sound"
fi
