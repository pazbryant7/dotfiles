check_and_source_files() {
	for item in "$@"; do
		if [ -d "$item" ]; then
			if command -v fd &>/dev/null; then
				result=$(fd --full-path plugin.zsh "$item")
				while IFS= read -r file_path; do
					if [ -f "$file_path" ]; then
						source "$file_path"
					fi
				done <<<"$result"
			fi
		elif [ -r "$item" ]; then
			source "$item"
		fi
	done
}

cheat() { clear && curl cheat.sh/"$1"; }

pwdp() {
	echo "$(pwd)/$1"
}
