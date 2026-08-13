#!/usr/bin/env bash

STATE_FILE="/tmp/hypr_lock_mode"

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"

    if ! pgrep -x waybar > /dev/null; then
        waybar & disown
    fi

    hyprctl eval 'hl.config({ general = { border_size = 1, gaps_in = 3.5, gaps_out = 7 }, decoration = { rounding = 7 } })'
else
    touch "$STATE_FILE"

    if pgrep -x waybar > /dev/null; then
        pkill -x waybar
    fi

    hyprctl eval 'hl.config({ general = { border_size = 0, gaps_in = 0, gaps_out = 0 }, decoration = { rounding = 0 } })'
fi
