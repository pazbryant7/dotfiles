#!/bin/sh
DIR="$HOME/Videos/screenshots"
FLAG_FILE="$DIR/recording_flag"

toggle_recording() {
	if [ -e "$FLAG_FILE" ]; then
		dunstify "Recording stopped"
		rm "$FLAG_FILE"
		pkill -x ffmpeg
	else
		dunstify "Recording started"
		touch "$FLAG_FILE"
		# Execute the ffmpeg command without audio recording
		ffmpeg -f x11grab \
			-s 1920x1080 \
			-r 25 \
			-i :0.0 \
			-c:v libx264 \
			-preset ultrafast \
			-crf 18 \
			"$DIR"/"recording-$(date +"%d-%m-%Y_%H%M%S").mp4"
	fi
}

toggle_recording
