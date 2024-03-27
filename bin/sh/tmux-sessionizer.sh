#!/bin/sh

if [[ $# -eq 2 ]]; then
    selected_dir=$1
    selected_file=$2
elif [[ $# -eq 1 ]]; then
    selected_dir=$1
else
    selected_dir=$(fd --min-depth 1 --max-depth 1 --type d . ~/Documents/github ~/Documents/github/examples ~/Downloads | fzf)
fi

if [[ -z $selected_dir ]]; then
    exit 0
fi

selected_name=$(basename "$selected_dir" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    if [[ -n $selected_file ]]; then
        tmux new-session -s $selected_name "nvim $selected_file"
    else
        tmux new-session -s $selected_name -c $selected_dir
    fi
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    if [[ -n $selected_file ]]; then
        tmux new-session -ds $selected_name "nvim $selected_file"
    else
        tmux new-session -ds $selected_name -c $selected_dir
    fi
fi

tmux switch-client -t $selected_name
