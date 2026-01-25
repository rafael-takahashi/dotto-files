#!/usr/bin/env bash

STATE_FILE="/tmp/hyprsunset_night_mode"

if [ -f "$STATE_FILE" ]; then
    hyprctl hyprsunset identity
    rm "$STATE_FILE"
else
    hyprctl hyprsunset temperature 2750
    touch "$STATE_FILE"
fi
