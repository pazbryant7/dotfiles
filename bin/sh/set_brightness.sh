#!/bin/zsh
#
brightness=$(rofi -dmenu -p "Enter brightness (0 to 1.0):" -lines 1)

# Check if the input is '2' and set brightness to 0.5 by default
if [[ "$brightness" == "2" ]]; then
    brightness="0.5"
fi

if [[ $brightness =~ ^[0-1](\.[0-9]+)?$ ]]; then
    xrandr --output HDMI-2 --brightness $brightness
    notify-send -t 2000 "Brightness updated"
else
    # If not valid, show a message in dunst
    notify-send -t 2000 "Invalid input"
fi
