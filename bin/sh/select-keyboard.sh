#!/bin/sh

set -x
set -e

CURRENT_KEYBOARD="$HOME/.current_keyboard"

read_state() {
	bat "$CURRENT_KEYBOARD"
}

set_keyboard_layout() {
	xmodmap "$1"
}

send_notification() {
	dunstify "$1 layout"
}

toggle_keyboard() {
	state="$1"

	devorak="Devorak"
	spanish="Spanish"

	if [ "$state" = "$devorak" ]; then
		set_keyboard_layout "$SPANISH_LAYOUT"
		echo "$spanish" >"$CURRENT_KEYBOARD"
	else
		set_keyboard_layout "$DEVORAK_LAYOUT"
		echo "$devorak" >"$CURRENT_KEYBOARD"
	fi
}

CURRENT_STATE=$(read_state)
toggle_keyboard "$CURRENT_STATE"

CURRENT_STATE=$(read_state)
send_notification "$CURRENT_STATE"
