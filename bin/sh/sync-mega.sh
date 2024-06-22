#!/bin/bash

set -x
set -e

# Set the paths
local_folder="$HOME/mega"
remote_folder="mega:MEGAsync"
# Check if there are changes
if rclone check "$remote_folder" "$local_folder" &>/dev/null; then
	# No changes, show notification and exit
	dunstify "MegaSync" "No changes to sync."
	exit 0
fi

# Proceed with sync
rclone sync "$remote_folder" "$local_folder"
dunstify "MegaSync" "Sync from mega to local"
