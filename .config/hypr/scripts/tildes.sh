#!/bin/bash

key="$1"  # Get the argument passed to the script (e.g., "a")

#á, é, í, ó, ú, ü, ñ, ¿, ¡
case "$key" in
  "a") wl-copy á ;;
  "e") wl-copy é ;;
  "i") wl-copy í ;;
  "o") wl-copy ó ;;
  "u") wl-copy ú ;;
  "n") wl-copy ñ ;;
  # Add more cases for other accents (e.g., "i") wl-copy í ;;
  *) echo "Unsupported character";;
esac

# Simulate pasting the copied character
wl-paste
