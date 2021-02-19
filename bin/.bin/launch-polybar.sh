#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -rq "$1" &

echo "Polybar launched..."
#wmctrl -m | sed -e '1q' | cut -d':' -f2
