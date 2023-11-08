#!/bin/sh

backup_source="/home/bryant/Music/"
backup_destination="/home/bryant/external"

# Specify the external drive details
external_drive="/dev/sda" # Replace with the appropriate device identifier for your external drive
external_mount_point="$backup_destination/"

# Check if the drive is already mounted
if ! grep -qs "$external_mount_point" /proc/mounts; then
	# Create the mount point if it doesn't exist
	mkdir -p "$external_mount_point"

	# Mount the external drive
	mount "$external_drive" "$external_mount_point"
fi

# Exclude folders from the backup
exclude_folders=""

# Additional system folders to be excluded
additional_excludes=""

previous_backup="$backup_destination/Music"
backup_folder="$backup_destination/Music"
mkdir -p "$backup_folder"

# Run rsync to perform the backup
rsync -aAXv --delete $additional_excludes $(echo $exclude_folders | sed 's/\w\+/--exclude=&/g') --link-dest="$previous_backup" "$backup_source" "$backup_folder/"

# Unmount the external drive after the backup is complete
umount "$external_drive"

exit 0
