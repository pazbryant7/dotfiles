#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/Documents/github/notes"
remote_folder="mega:phone/notes"

# Display a dialog window to select the action
selected_option=$(echo -e "Sync from local to remote\nSync from remote to local\nCancel" | rofi -dmenu -i -p "Select Action:")

case "$selected_option" in
"Sync from local to remote")
	rclone sync "$local_folder" "$remote_folder" --exclude=".gitignore" --exclude=".git/**" --exclude=".prettierrc" --delete-before
	dunstify "Notes" "Sync successfully."
	;;
"Sync from remote to local")
	rclone sync "$remote_folder" "$local_folder" --exclude=".gitignore" --exclude=".git/**" --exclude=".prettierrc" --delete-before
	dunstify "Notes" "Sync successfully."
	;;
"Cancel")
	# User selected cancel, exit
	dunstify "Notes" "Action canceled."
	exit 0
	;;
esac
