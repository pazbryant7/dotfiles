#!/bin/sh
DIR="$HOME/mega/personal/audio"
FLAG_FILE="$DIR/audio_recording_flag"

toggle_recording() {
	if [ -e "$FLAG_FILE" ]; then
		pkill -f "sox -t pulseaudio default"
		rm "$FLAG_FILE"
		dunstify "Recording canceled"
	else
		mkdir -p "$DIR"
		output_file="$DIR/english-recorder-$(date +'%Y-%m-%d-%H%M').wav"
		sox -t pulseaudio default "$output_file" &
		touch "$FLAG_FILE"
		dunstify "Recording started"
	fi
}

toggle_recording
