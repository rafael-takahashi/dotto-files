#!/usr/bin/env bash

STATE_FILE="/tmp/hypr_lock_mode"

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"

    if ! pgrep -x waybar > /dev/null; then
        waybar & disown
    fi

    hyprctl keyword general:border_size 1
    hyprctl keyword decoration:rounding 7
    hyprctl keyword general:gaps_in 3.5
    hyprctl keyword general:gaps_out 7
else
    touch "$STATE_FILE"

    if pgrep -x waybar > /dev/null; then
        pkill -x waybar
    fi

    hyprctl keyword general:border_size 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
fi
