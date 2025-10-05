#!/bin/bash

if pgrep -x "keyd" >/dev/null; then
    vim_toggle_icon="  Vim Keys (On)"
else
    vim_toggle_icon="  Vim Keys (Off)"
fi

choice=$(echo -e "󰸉  Change Wallpaper\n  Keybindings\n󰆍  Startup Apps\n󱂬  Window Rules\n$vim_toggle_icon" | rofi -dmenu -hover-select -p "Settings" -theme ~/.config/rofi/arch-logo-large.rasi)

case "$choice" in
    "󰸉  Change Wallpaper")
        ~/.config/hypr/scripts/wallpaper-picker.sh
        ;;
    "  Keybindings")
        kitty nvim ~/.config/hypr/modules/keybind.conf
        ;;
    "󰆍  Startup Apps")
        kitty nvim ~/.config/hypr/modules/startup.conf
        ;;
    "󱂬  Window Rules")
        kitty nvim ~/.config/hypr/modules/windowrules.conf
        ;;
    *"Vim Keys"*)
      if pgrep -x "keyd" >/dev/null; then
        sudo systemctl stop keyd
        notify-send "Vim Keys" "Disabled (keyd stopped)"
      else
        sudo systemctl start keyd
        notify-send "Vim Keys" "Enabled (keyd running)"
      fi
      ;;
esac

