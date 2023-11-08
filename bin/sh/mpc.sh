#!/bin/sh

# Toggle random state
mpc random

# Introduce a short delay to allow the state to be updated
sleep 0.1

# Get the current state of random
current_state=$(mpc status | awk '/random/{print $6}')

# Display notification using dunst
dunstify "Random is: $current_state"
