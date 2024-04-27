#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/dropbox"
remote_folder="dropbox:DropboxSync"

# Display a dialog window to select the action
selected_option=$(echo -e "Sync from local to dropbox\nSync from dropbox to local\nCancel" | rofi -dmenu -i -p "Select Action:")

case "$selected_option" in
"Sync from local to dropbox")
	# Check if there are changes
	if rclone check "$local_folder" "$remote_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "DropboxSync" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$local_folder" "$remote_folder"
	dunstify "DropboxSync" "Sync from local to dropbox completed successfully."
	;;
"Sync from dropbox to local")
	# Check if there are changes
	if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
		# No changes, show notification and exit
		dunstify "DropboxSync" "No changes to sync."
		exit 0
	fi

	# Proceed with sync
	rclone sync "$remote_folder" "$local_folder"
	dunstify "DropboxSync" "Sync from dropbox to local completed successfully."
	;;
"Cancel")
	# User selected cancel, exit
	dunstify "DropboxSync" "Action canceled by the user."
	exit 0
	;;
esac
