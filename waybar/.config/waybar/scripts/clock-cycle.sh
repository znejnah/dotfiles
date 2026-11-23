#!/usr/bin/env bash
# Dynamic Vice City solar clock with hover calendar and click-to-toggle date

STATE_FILE="/tmp/waybar_clock_mode"

# Toggle mode when called with --toggle (on-click)
if [ "$1" = "--toggle" ]; then
    if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "date" ]; then
        echo "time" > "$STATE_FILE"
    else
        echo "date" > "$STATE_FILE"
    fi
    pkill -RTMIN+8 waybar
    exit 0
fi

MODE="time"
[ -f "$STATE_FILE" ] && MODE=$(cat "$STATE_FILE")

HOUR=$(date +%H)
TIME=$(date +"%H:%M")
SHORT_DATE=$(date +"%a %d %b")
TODAY=$(date +%-d)
HEADER=$(date +"%B %Y")

# Solar cycle intervals & Vice City accents
if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 11 ]; then
    CLASS="dawn"
    ICON="󰖜"
    ACCENT="#00f0ff"
elif [ "$HOUR" -ge 11 ] && [ "$HOUR" -lt 17 ]; then
    CLASS="day"
    ICON="󰖙"
    ACCENT="#ffb86b"
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 21 ]; then
    CLASS="sunset"
    ICON="󰖚"
    ACCENT="#ff5ca8"
else
    CLASS="night"
    ICON="󰖔"
    ACCENT="#8c6cff"
fi

# Display either time or current date based on click toggle
if [ "$MODE" = "date" ]; then
    TEXT="󰃭 $SHORT_DATE"
else
    TEXT="$ICON $TIME"
fi

# Generate current month calendar (Monday first) and highlight today on Abyssal Night
CAL=$(cal -m | tail -n +2 | sed -E "s/(^| )($TODAY)( |$)/\1<span color='#07091b' background='$ACCENT'><b>\2<\/b><\/span>\3/")
TOOLTIP="<span color='$ACCENT'><b>$HEADER</b></span>\n<tt><small>$CAL</small></tt>"
TOOLTIP_ESCAPED=$(printf '%s' "$TOOLTIP" | sed ':a;N;$!ba;s/\n/\\n/g')

printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$TEXT" "$TOOLTIP_ESCAPED" "$CLASS"
