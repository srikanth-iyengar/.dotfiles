#!/bin/bash

PIPE="/tmp/eww-pipe"
[ -p "$PIPE" ] || mkfifo "$PIPE"

# Endless read loop that survives writer disconnects
tail -F /tmp/eww-pipe
