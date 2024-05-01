#!/bin/bash

# Set the paths
local_folder="$HOME/Documents/github/notes"
remote_folder="mega:phone/notes"

if ! rclone check "$remote_folder" "$local_folder" &>/dev/null; then
	rclone sync "$remote_folder" "$local_folder"
fi

if ! rclone check "$local_folder" "$remote_folder" &>/dev/null; then
	rclone sync "$local_folder" "$remote_folder"
fi

dunstify "Notes" "Successfully sync"
