#!/bin/sh

# Function to check if curl is installed
check_xh() {
  if ! command -v xh >/dev/null 2>&1; then
    echo "Error: curl is not installed. Please install curl and try again."
    exit 1
  fi
}

# Function to prompt user confirmation
update_firefox() {
  bash -c "$(
    xh --follow --all https://raw.githubusercontent.com/black7375/Firefox-UI-Fix/master/install.sh
  )"
}

# Main script logic
main() {
  check_xh
  update_firefox
}

# Run the main function
main
