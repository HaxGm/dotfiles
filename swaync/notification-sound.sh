#!/bin/bash

if [ "$(swaync-client --get-dnd)" = "false" ]; then
  pw-play /home/piotr/Coding/dotfiles/swaync/notification.ogg
fi
