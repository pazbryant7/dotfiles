#!/bin/sh

set -x
set -e

# Set the paths
local_folder="$HOME/mega"
remote_folder="mega:MEGAsync"

rclone copy "$local_folder" "$remote_folder" -L
rclone sync "$remote_folder" "$local_folder"

dunstify "Mega" "Successfully"
