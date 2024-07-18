package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"
)

const (
	recordingFilePath = "/home/bryant/.recording"
)

func isRecording() bool {
	_, err := os.Stat(recordingFilePath)
	return !os.IsNotExist(err)
}

func createRecordingFile() error {
	f, err := os.Create(recordingFilePath)
	if err != nil {
		return fmt.Errorf("error creating .recording file: %w", err)
	}
	return f.Close()
}

func removeRecordingFile() error {
	return os.Remove(recordingFilePath)
}

func getPactlOutput() (string, error) {
	cmd := exec.Command("pactl", "list", "sources", "short")
	output, err := cmd.Output()
	if err != nil {
		return "", fmt.Errorf("error fetching pactl output: %w", err)
	}
	return string(output), nil
}

func getAudioSources() (string, error) {
	const (
		headphonesSource = "alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
		monitorSource    = "alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor"
	)

	sources, err := getPactlOutput()
	if err != nil {
		return "", err
	}

	if strings.Contains(sources, headphonesSource) {
		return headphonesSource, nil
	}

	return monitorSource, nil
}

func start(audioSource string) {
	const (
		recordingDir = "/home/bryant/Videos/Recordings"
		ffmpegArgs   = "-f x11grab -s 1920x1080 -r 30 -i :0.0 " +
			"-f pulse -i %s " +
			"-probesize 42M " +
			"-c:v libx265 -preset fast -crf 22 -tune zerolatency " +
			"-c:a aac -b:a 192k %s/recording-%s.mkv"
	)
	timestamp := time.Now().Format("02-01-2006_150405")

	cmdArgs := fmt.Sprintf(ffmpegArgs, audioSource, recordingDir, timestamp)
	cmd := exec.Command("ffmpeg", strings.Split(cmdArgs, " ")...)

	if err := cmd.Start(); err != nil {
		fmt.Errorf("Error", err)
		return
	}

	if err := createRecordingFile(); err != nil {
		fmt.Errorf("Error", err.Error())
		return
	}

	showNotification("Recording started", "")
}

func stop() {
	cmd := exec.Command("pkill", "-x", "ffmpeg")
	if err := cmd.Run(); err != nil {
		fmt.Errorf("Error", err)
		return
	}

	if err := removeRecordingFile(); err != nil {
		fmt.Errorf("Error", err)
		return
	}

	showNotification("Recording finalized", "")
}

func toggleRecording(audioSource string) {
	if isRecording() {
		stop()
	} else {
		start(audioSource)
	}
}

func showNotification(summary, body string) {
	cmd := exec.Command("dunstify", summary, body)
	if err := cmd.Run(); err != nil {
		fmt.Println("Error displaying notification:", err)
	}
}

func main() {
	audioSource, err := getAudioSources()
	if err != nil {
		fmt.Errorf("Error", err)
		return
	}
	toggleRecording(audioSource)
}
