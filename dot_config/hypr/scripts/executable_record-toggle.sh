#!/usr/bin/env bash
# Toggle region screen recording (GPU encoded via VAAPI on AMD)
if pgrep -x wf-recorder >/dev/null; then
    pkill -INT -x wf-recorder
    notify-send "Recording saved" "~/Downloads"
    exit 0
fi

region=$(slurp) || exit 0   # cancelled selection -> do nothing
file="$HOME/Downloads/rec-$(date +%Y%m%d-%H%M%S).mp4"

notify-send "Recording started"
exec wf-recorder -g "$region" -f "$file" -c h264_vaapi -d /dev/dri/renderD128
