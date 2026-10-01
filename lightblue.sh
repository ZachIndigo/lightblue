#!/bin/sh
[ "$UID" -eq 0 ] && BLINKPATH="$HOME"
[ -z "$BLINKPATH" ] && BLINKPATH="$HOME/Scripts"
BLINKPATH="$BLINKPATH/venv/bin"

"$BLINKPATH/python3.14" "$BLINKPATH/blinkstick" --set-color "#4040ff"

