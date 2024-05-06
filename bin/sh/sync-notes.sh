#!/bin/bash

set -x

local_folder="$HOME/Documents/github/notes"
remote_folder="mega:phone/notes"

sync_options='--exclude=".gitignore" \
--exclude=".git/**" \
--exclude=".prettierrc" \
--delete-before'

sync_notes_from() {
	from=$1
	to=$2
	options=$3

	rclone sync "$from" "$to" "$options"

	if [ "$?" -eq 0 ]; then
		return 0 # Success
	else
		return 1 # Failure
	fi
}

send_notification() {
	message=$1
	dunstify "Notes" "$message"
}

sync() {
	case "$1" in
	"Sync from local to remote")
		sync_notes_from "$local_folder" "$remote_folder" "$sync_options" &&
			send_notification "Sync successfully." ||
			send_notification "Sync failed."
		;;
	"Sync from remote to local")
		sync_notes_from "$remote_folder" "$local_folder" "--delete-before" &&
			send_notification "Sync successfully." ||
			send_notification "Sync failed."
		;;
	"Cancel")
		# User selected cancel, exit
		send_notification "Action canceled."
		;;
	esac
}

if (("$1" == "hook")); then
	selected_option="Sync from local to remote"
else
	selected_option=$(echo -e "Sync from local to remote\nSync from remote to local\nCancel" |
		rofi -dmenu -i -p "Select Action:")
fi

sync "$selected_option"
