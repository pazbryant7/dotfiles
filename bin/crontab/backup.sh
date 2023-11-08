#!/bin/sh

backup_source="/"
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
exclude_folders="Desktop Documents Downloads mega Music Pictures Videos github external git_sim_media .cache Music /home/bryant/.cache"

# Additional system folders to be excluded
additional_excludes="--exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/run --exclude=/mnt --exclude=/media --exclude=/lost+found --exclude=/var/log --exclude=/var/tmp --exclude=/var/run --exclude=/swapfile --exclude=/.cache"

backup_date=$(date +%Y-%m-%d)
previous_backup="$backup_destination/backup/previous"
backup_folder="$backup_destination/backup/$backup_date"
mkdir -p "$backup_folder"

# Run rsync to perform the backup
rsync -aAXv --delete $additional_excludes $(echo $exclude_folders | sed 's/\w\+/--exclude=&/g') --link-dest="$previous_backup" "$backup_source" "$backup_folder/"

# Unmount the external drive after the backup is complete
umount "$external_drive"

exit 0
