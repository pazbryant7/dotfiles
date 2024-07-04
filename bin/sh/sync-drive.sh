#!/bin/bash

set -x
set -e

# Set the paths
local_folder="$HOME/drive"
remote_folder="drive:"

rclone copy "$local_folder" "$remote_folder" -L
rclone sync "$remote_folder" "$local_folder"

dunstify "Drive" "Successfully"
