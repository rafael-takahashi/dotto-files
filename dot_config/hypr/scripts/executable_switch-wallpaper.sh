#!/usr/bin/env bash

WALLPAPER_DIR="/home/rafael/Pictures/Wallpapers"
CACHE_FILE="/tmp/wallpaper_map"

refresh_cache() {
    > "$CACHE_FILE"
    find "$WALLPAPER_DIR" -maxdepth 1 -type f | sort | while read -r FILE; do
        NAME=$(basename "$FILE")
        NAME="${NAME%.*}"
        echo "$NAME:$FILE" >> "$CACHE_FILE"
    done
}

if [ ! -s "$CACHE_FILE" ]; then
    refresh_cache
fi

declare -A FILE_MAP
NAMES=()
while IFS=: read -r NAME FILE; do
    NAMES+=("$NAME")
    FILE_MAP["$NAME"]="$FILE"
done < "$CACHE_FILE"

SELECTED=$(printf "%s\n" "${NAMES[@]}" | \
    rofi -dmenu -i -p "Select Wallpaper" -theme-str '
        window {width: 35%; height: 40%;}
    ')

if [ -n "$SELECTED" ]; then
    FILE="${FILE_MAP[$SELECTED]}"
    if [ -n "$FILE" ]; then
        hyprctl hyprpaper wallpaper eDP-1,"$FILE"
        hyprctl hyprpaper wallpaper HDMI-A-1,"$FILE"
    fi
fi

if [[ "$1" == "--refresh" ]]; then
    refresh_cache
fi
