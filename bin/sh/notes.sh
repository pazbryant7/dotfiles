#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/Documents/github/notes"
remote_folder="mega:phone/notes"

# Display a dialog window to select the action
selected_option=$(echo -e "Sync from local to remote\nSync from remote to local\nCancel" | rofi -dmenu -i -p "Select Action:")

case "$selected_option" in
"Sync from local to remote")
	# Check if there are changes
	if rclone check "$local_folder" "$remote_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "Notes" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$local_folder" "$remote_folder" --exclude=".git/**" --delete-before
	dunstify "Notes" "Sync from local to remote completed successfully."
	;;
"Sync from remote to local")
	# Check if there are changes
	if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "Notes" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$remote_folder" "$local_folder" --exclude=".git/**" --delete-before
	dunstify "Notes" "Sync from remote to local completed successfully."
	;;
"Cancel")
	# User selected cancel, exit
	dunstify "Notes" "Action canceled by the user."
	exit 0
	;;
esac
