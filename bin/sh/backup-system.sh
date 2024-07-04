#!/bin/sh

set -x
set -e

backup_source="/"
backup_destination="/home/bryant/external"

# Specify the external drive details
external_drive="/dev/sda1" # Replace with the appropriate device identifier for your external drive
external_mount_point="$backup_destination/"

# Check if the drive is already mounted
if ! grep -qs "$external_mount_point" /proc/mounts; then
  # Create the mount point if it doesn't exist
  mkdir -p "$external_mount_point"

  # Mount the external drive
  mount "$external_drive" "$external_mount_point"

  # Check if the mount was successful
  if [ $? -eq 0 ]; then
    echo "Drive mounted successfully."
  else
    echo "Failed to mount the drive."
    exit 1
  fi
fi

# Exclude folders from the backup
exclude_folders="
  home/bryant/Desktop home/bryant/Documents home/bryant/Downloads
  home/bryant/mega home/bryant/Pictures home/bryant/Videos
  home/bryant/external home/bryant/.cache home/bryant/.tealdeer-cache
"

# Additional system folders to be excluded
additional_excludes="
  --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp
  --exclude=/run --exclude=/mnt --exclude=/media --exclude=/lost+found
  --exclude=/var/log --exclude=/var/tmp --exclude=/var/run
  --exclude=/swapfile --exclude=*/Cache --exclude=*/cache --exclude=*/.cache
"

backup_date=$(date +%Y-%m-%d)
previous_backup="$backup_destination/backup/previous"
backup_folder="$backup_destination/backup/$backup_date"
mkdir -p "$backup_folder"
mkdir -p "$previous_backup"

# Convert exclude arrays to rsync options
exclude_params=""
for folder in $exclude_folders; do
  exclude_params="$exclude_params --exclude=/$folder"
done

exclude_params="$exclude_params $additional_excludes"

# Run rsync to perform the backup
rsync -aAXv --delete --progress "$exclude_params" --link-dest="$previous_backup" "$backup_source" "$backup_folder"

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
