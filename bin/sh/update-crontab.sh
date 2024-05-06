#!/bin/sh

# Set the path to the crontab folder
crontab_backup="$HOME/Documents/github/dotfiles/.conf/crontab/crontab"
original_crontab_file="/var/spool/cron/bryant"

bat "$original_crontab_file" >"$crontab_backup"

dunstify "Crontab" "updating crontab file"
