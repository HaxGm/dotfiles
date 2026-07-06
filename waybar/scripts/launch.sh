#!/bin/bash

pkill waybar
pkill swaync

sleep .2

waybar &
swaync &
