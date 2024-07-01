#!/bin/sh

# Function to recursively rename files and directories to lowercase
rename_to_lowercase() {
	for item in "$1"/*; do
		# Get the base name of the item
		base_item=$(basename "$item")
		# Get the lowercase version
		lowercase_item=$(echo "$base_item" | tr '[:upper:]' '[:lower:]')

		# Rename the item if necessary
		if [ "$base_item" != "$lowercase_item" ]; then
			mv "$item" "$(dirname "$item")/$lowercase_item"
		fi

		# Recurse if it's a directory
		if [ -d "$(dirname "$item")/$lowercase_item" ]; then
			rename_to_lowercase "$(dirname "$item")/$lowercase_item"
		fi
	done
}

# Path to your pass store
pass_store_path="$HOME/.password-store"

# Call the function with the path to your pass store
rename_to_lowercase "$pass_store_path"
