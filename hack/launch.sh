#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/hack"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top -c "$DIR"/config.ini &
done

# Launch the bar
#polybar -q top -c "$DIR"/config.ini &
#polybar -q bottom -c "$DIR"/config.ini &
