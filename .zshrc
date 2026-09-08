#!/usr/bin/env zsh

shell_dir="$HOME/.shell"
zsh_dir="$HOME/.zsh"
source "$shell_dir/load" || return
load_modules "$shell_dir" "$zsh_dir" || return
