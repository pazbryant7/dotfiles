#!/bin/sh

set -x

BOOKS_DIR="$HOME/mega/personal/books"
LAST_READ_BOOK_PATH="$HOME/.last-read-book"

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

get_last_book() {
	rg "/home/bryant/mega/personal/books/" "$LAST_READ_BOOK_PATH"
}

update_last_read_book() {
	echo "$1" >"$LAST_READ_BOOK_PATH"
}

read_option=$(printf "Read last book\nCancel" |
	rofi -dmenu -i -p "Select Action:")

last_read_book=$(get_last_book)

[ "$read_option" = "Read last book" ] && [ -n "$last_read_book" ] && {
	zathura "$last_read_book"
	exit 0
}

selected_folder=$(select_folder)

# Check if a folder was selected
[ -z "$selected_folder" ] && {
	echo "No folder selected. Exiting."
	exit 1
}

# List files within the selected folder
books=$(list_files_in_folder "$selected_folder")

# Check if books were found in the selected folder
[ -z "$books" ] && {
	echo "No books found in the selected folder. Exiting."
	exit 1
}

# Select a book file using Rofi
selected_book=$(select_book "$selected_folder")

# Check if a book was selected
[ -z "$selected_book" ] && {
	echo "No book selected. Exiting."
	exit 1
}

selected_book_file_path="$BOOKS_DIR/$selected_folder/$selected_book"

update_last_read_book "$selected_book_file_path" &&
	zathura "$selected_book_file_path" &
