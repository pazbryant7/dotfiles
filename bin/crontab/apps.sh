#!/bin/sh

dotfiles_path="/home/bryant/Documents/github/dotfiles/apps/"

pacman -Qen | sort >"$dotfiles_path/installed_apps.txt"
paru -Qm | sort >"$dotfiles_path/installed_aur_apps.txt"
pipx list | sort >"$dotfiles_path/pipx_installed.txt"
ls ~/.cargo/bin/ | sort >"$dotfiles_path/cargo_installed.txt"
flatpak list | sort >"$dotfiles_path/flatpak_installed.txt"
ls ~/go/bin/ | sort > "$dotfiles_path/go_installed.txt"


dunstify  "Notification" "update apps database"
