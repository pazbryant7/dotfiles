#!/bin/sh

backup_source="/home/bryant/Music/"
backup_destination="/home/bryant/external"

# Specify the external drive details
external_drive="/dev/sda1" # Replace with the appropriate device identifier for your external drive
external_mount_point="$backup_destination/"

# Check if the drive is already mounted
if ! grep -qs "$external_mount_point" /proc/mounts; then
	# Create the mount point if it doesn't exist
	mkdir -p "$external_mount_point"

	# Mount the external drive
	if mount "$external_drive" "$external_mount_point"; then
		echo "Drive mounted successfully."
	else
		echo "Failed to mount the drive."
		exit 1
	fi
fi

previous_backup="$backup_destination/Music"
backup_folder="$backup_destination/Music"
mkdir -p "$backup_folder"

# Run rsync to perform the backup
rsync -aAXv --delete --link-dest="$previous_backup" "$backup_source" "$backup_folder/"

# Unmount the external drive after the backup is complete
umount "$external_mount_point"

# Check if the unmount was successful
if [ $? -eq 0 ]; then
	echo "Drive unmounted successfully."
else
	echo "Failed to unmount the drive."
	exit 1
fi

exit 0
