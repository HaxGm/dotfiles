#!/bin/bash

# Resolve through the ~/.config/swaync symlink to wherever this repo actually
# lives, so the sound is found no matter where it's checked out.
sound="$(dirname "$(readlink -f "$0")")/notification.ogg"

if [ "$(swaync-client --get-dnd)" = "false" ]; then
  pw-play "$sound"
fi
