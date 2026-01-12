#!/bin/bash

# List of themes
themes=("Bar 1" "Bar 2" "Bar 3")
#theme
theme="$HOME/.config/rofi/type-7/simple.rasi"

# Show menu in rofi
selected=$(printf '%s\n' "${themes[@]}" | rofi -dmenu -theme $theme -p "Choose a theme:")

# Exit if nothing selected
[ -z "$selected" ] && exit

echo "You selected: $selected"

# Copy config files based on selection
cp ~/.config/waybar/"$selected"/config.jsonc ~/.config/waybar/
cp ~/.config/waybar/"$selected"/style.css ~/.config/waybar/

# Restart Waybar to apply the new theme
pkill -x waybar
waybar & disown