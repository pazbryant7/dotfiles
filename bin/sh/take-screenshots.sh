#!/bin/sh
DIR="$HOME/Pictures/Screenshots"

save_cropped_clipboard() {
	maim --select "$DIR/$(date).png"
}

save_full_clipboard() {
	maim "$DIR/$(date).png"
}

send_notification() {
	dunstify "Screenshot saved"
}

case $1 in
full)
	save_full_clipboard
	;;
cropped)
	save_cropped_clipboard
	;;
esac

send_notification
