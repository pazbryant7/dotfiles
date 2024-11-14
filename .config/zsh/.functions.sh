#!/bin/env sh

yy() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd" || return
  fi
  rm -f -- "$tmp"
}

xevkeys() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

# Function to reload the Zsh configuration
rel() {
  . /home/bryant/.zshrc
}

gignore() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: ignore language1,language2,..."
    echo "Example: ignore node,python"
    return 1
  fi

  # Combine all arguments into a comma-separated string
  languages="$1"
  shift

  for arg in "$@"; do
    languages="${languages},${arg}"
  done

  # Fetch the .gitignore template from gitignore.io
  curl -L -s "https://www.gitignore.io/api/${languages}"
}

architecture() {
  architecture=""
  case $(uname -m) in
  i386) architecture="386" ;;
  i686) architecture="386" ;;
  x86_64) architecture="amd64" ;;
  arm) dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
  esac

  echo "$architecture"
}

ds() {
  if [ -z "$1" ]; then
    echo "Usage: check_disk_space /dev/sdax"
    return 1
  fi

  df -h "$1" | awk 'NR==2 {print "Total space on", $1, ":", $2, "| Free space:", $4}'
}

play() {
  if [ -z "$1" ]; then
    echo "Usage: play <url> <best/worst/low/medium/720/480>" 1>&2
    echo "Media url was not given"
    return 1
  fi

  if [ -z "$2" ]; then
    echo "Usage: play <url> <best/worst/low/medium/720/480>" 1>&2
    echo "Quality option was not given"
    return 1
  fi

  # Check if streamlink is installed
  if ! command -v streamlink >/dev/null 2>&1; then
    echo "Error: streamlink is not installed." 1>&2
    return 1
  fi

  # Check if mpv is installed
  if ! command -v mpv >/dev/null 2>&1; then
    echo "Error: mpv is not installed." 1>&2
    return 1
  fi

  twitch_args=""
  case "$1" in
  https://www.twitch.tv/*)
    twitch_args="--twitch-disable-ads"
    ;;
  esac

  # Map custom quality options
  case "$2" in
  low)
    quality="480p30"
    ;;
  medium)
    quality="720p60"
    ;;
  best | worst | 480p30 | 720p60)
    quality="$2"
    ;;
  *)
    echo "Error: Invalid quality option. Use best, worst, low, medium, 480p, or 720p." 1>&2
    return 1
    ;;
  esac

  # Run streamlink with mpv, adding the Twitch argument if needed
  streamlink "$twitch_args" -p mpv "$1" "$quality"
}

updategrub() {
  sudo grub-mkconfig -o /boot/grub/grub.cfg
}

cheat() {
  if [ -z "$1" ]; then
    echo "Usage: cheat <command>"
    return 1
  fi

  # Fetch the cheat sheet using curl
  curl -s "https://cheat.sh/$1"
}
