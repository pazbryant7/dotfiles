#!/bin/bash

base_dir="$HOME/bin/"

# Check if rofi and dunstify are installed
if ! command -v rofi &>/dev/null || ! command -v dunstify &>/dev/null; then
	echo "Error: 'rofi' or 'dunstify' is not installed. Please install both and try again."
	exit 1
fi

# Use find to locate all shell script files in the base directory and its subdirectories
script_list=$(find "$base_dir" -type f -name "*.sh")

# Check if script_list is empty
if [[ -z $script_list ]]; then
	dunstify "No shell script files found in $base_dir and its subdirectories." -t 1000
	exit 1
fi

# Extract only the script names without the path
script_names=$(echo "$script_list" | xargs -n 1 basename)

# Use rofi to create a searchable list of script names
chosen_script=$(echo "$script_names" | rofi -dmenu -p "Choose a script:")

if [[ -n $chosen_script ]]; then
	# Find the full path of the selected script
	full_path=$(echo "$script_list" | grep "/$chosen_script$")

	if [[ -n $full_path ]]; then
		# Execute the selected script
		bash "$full_path"
	fi
fi
