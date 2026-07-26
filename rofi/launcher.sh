#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='style'

## Run
pkill -x rofi || rofi \
    -show drun \
    -theme "${dir}/${theme}.rasi"
