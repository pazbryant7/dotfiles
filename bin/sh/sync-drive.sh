#!/bin/bash

set -x

# Set the paths
local_folder="$HOME/drive"
remote_folder="drive:"

if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
	# No changes, show notification and exit
	dunstify "Google drive" "No changes to sync."
	exit 0
fi

# Proceed with sync
rclone sync "$remote_folder" "$local_folder"
dunstify "Google drive" "Sync from drive to local completed successfully."
