#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/drive"
remote_folder="drive:"

# Display a dialog window to select the action
selected_option=$(echo -e "Sync from local to drive\nSync from drive to local\nCancel" |
	rofi -dmenu -i -p "Select Action:")

case "$selected_option" in
"Sync from local to drive")
	# Check if there are changes
	if rclone check "$local_folder" "$remote_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "Google drive" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$local_folder" "$remote_folder"
	dunstify "Google drive" "Sync from local to drive completed successfully."
	;;
"Sync from drive to local")
	# Check if there are changes
	if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "Google drive" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$remote_folder" "$local_folder"
	dunstify "Google drive" "Sync from drive to local completed successfully."
	;;
"Cancel")
	# User selected cancel, exit
	dunstify "Google drive" "Action canceled by the user."
	exit 0
	;;
esac
