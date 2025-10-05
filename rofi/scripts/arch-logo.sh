#!/bin/bash

# Simple Waybar dropdown menu using rofi

choice=$(echo -e "󰒓  Settings\n󰐥  Power\n󰋽  About" | rofi -dmenu -hover-select -p "" -theme ~/.config/rofi/arch-logo.rasi)

case "$choice" in
    "󰐥  Power")
        wlogout -b 4
        ;;
    "󰒓  Settings")
        ~/.config/rofi/scripts/settings_menu.sh
        ;;
    "󰋽  About")
        kitty --class about -T "About System" $fastfetch &
        ;;
esac

