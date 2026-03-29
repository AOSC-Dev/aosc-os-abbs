#!/bin/sh

# Auto-read DRM Panel Orientation property and rotate screen and touch input
# -----------------------------------------------------------------------------
# This script is authored with assistance from AI/LLM:
# - Model: Gemini 3.1 Pro
# - Platform: Google Gemini (https://gemini.google.com/)
# - Agent platform: Antigravity IDE (https://antigravity.google/product/antigravity-ide/)
# - Prompt:
# ```
#   Write a bash script for SDDM Xsetup to automatically rotate the X11 
#   display based on the DRM panel_orientation property using xrandr, and 
#   map touchinputs to the rotated output using xinput. Ensure it matches 
#   unconventional touch IC names like 'NVTK0603:00 0603:F001'.
# ```
# -----------------------------------------------------------------------------

if command -v xrandr >/dev/null 2>&1; then
    xrandr --props | awk '
        /^[^ \t].* connected/ { output=$1 }
        /panel orientation:/ { 
            sub(/.*panel orientation:[ \t]+/, "");
            print output, $0
        }
    ' | while read -r output orientation; do
        
        # Rotate video output
        case "$orientation" in
            "Right Side Up") xrandr --output "$output" --rotate right ;;
            "Left Side Up")  xrandr --output "$output" --rotate left ;;
            "Upside Down")   xrandr --output "$output" --rotate inverted ;;
            *) continue ;;
            # If screen orientation is Normal or other cases,
            # skip directly without executing subsequent touch mapping.
        esac

        # Map touch input coordinates to the rotated output
        if command -v xinput >/dev/null 2>&1; then
            xinput list --name-only | grep -iE "touch|digitizer|pen|wacom|elan|goodix|nvtk" | while read -r touch_dev; do
                xinput map-to-output "$touch_dev" "$output"
            done
        fi

    done
fi
