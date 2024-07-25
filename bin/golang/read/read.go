package main

import (
	"fmt"
	"os/exec"
)

const (
	booksDir = "/home/bryant/mega/personal/pc/books"
)

func listFolrders() (string, error) {
	cmd := exec.Command("fd", "--type", "--max-depth", "1", "--base-directory", booksDir)
	output, err := cmd.Output()
	if err != nil {
		return "", fmt.Errorf("error fetching fd output: %w", err)
	}
	println(string(output))
	return string(output), nil
}

func listFilesInFolder() {}

func seletFolder() {}

func selectBook() {}

func getLastBook() {}

func updateLasReadBook() {}

func promptLastReadBook() {}

func main() {
	listFolrders()
}
