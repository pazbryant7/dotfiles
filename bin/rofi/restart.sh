#!/bin/sh

# Restart the computer
restart_computer() {
  dunstify "Restarting" && sleep 1
  # Call systemctl to restart the computer
  systemctl reboot
}

# Main function
main() {
  restart_computer
}

# Execute the main function
main
