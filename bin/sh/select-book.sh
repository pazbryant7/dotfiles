#!/bin/sh

set -x

BOOKS_DIR="$HOME/mega/personal/books"

list_folders() {
	fd --type directory \
		--max-depth 1 \
		--base-directory "$BOOKS_DIR" |
		xargs -I {} basename {}
}

# Function to list files within a selected folder
list_files_in_folder() {
	fd --type f --base-directory "$BOOKS_DIR/$1"
}

# Function to select a folder using Rofi
select_folder() {
	list_folders | rofi -dmenu -i -p "Select book folder"
}

# Function to select a book file using Rofi
select_book() {
	list_files_in_folder "$1" | rofi -dmenu -i -p "Select book"
}

SELECTED_FOLDER=$(select_folder)

# Check if a folder was selected
[ -z "$SELECTED_FOLDER" ] && {
	echo "No folder selected. Exiting."
	exit 1
}

# List files within the selected folder
BOOKS=$(list_files_in_folder "$SELECTED_FOLDER")

# Check if books were found in the selected folder
[ -z "$BOOKS" ] && {
	echo "No books found in the selected folder. Exiting."
	exit 1
}

# Select a book file using Rofi
SELECTED_BOOK=$(select_book "$SELECTED_FOLDER")

# Check if a book was selected
[ -z "$SELECTED_BOOK" ] && {
	echo "No book selected. Exiting."
	exit 1
}

# Apply the selected book using feh
zathura "$BOOKS_DIR/$SELECTED_FOLDER/$SELECTED_BOOK" &
