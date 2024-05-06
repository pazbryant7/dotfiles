#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/mega"
remote_folder="mega:MEGAsync"

# Display a dialog window to select the action
selected_option=$(echo -e "Sync from local to mega\nSync from mega to local\nCancel" | rofi -dmenu -i -p "Select Action:")

case "$selected_option" in
"Sync from local to mega")
	# Check if there are changes
	if rclone check "$local_folder" "$remote_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "MegaSync" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$local_folder" "$remote_folder"
	dunstify -u low -t 3000 "MegaSync" "Sync from local to mega completed successfully."
	;;
"Sync from mega to local")
	# Check if there are changes
	if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "MegaSync" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$remote_folder" "$local_folder"
	dunstify "MegaSync" "Sync from mega to local completed successfully."
	;;
"Cancel")
	# User selected cancel, exit
	dunstify "MegaSync" "Action canceled by the user."
	exit 0
	;;
esac
