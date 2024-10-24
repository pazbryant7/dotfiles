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
reload() {
  source /home/bryant/.zshrc
}

ignore() {
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

arch() {
  architecture=""
  case $(uname -m) in
  i386) architecture="386" ;;
  i686) architecture="386" ;;
  x86_64) architecture="amd64" ;;
  arm) dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
  esac

  echo "$architecture"
}

# rsync
rsyncbasic() {
  rsync -avh --progress "$1" "$2"
}

rsyncbackup() {
  rsync -avh --progress "$1" "$2/$(date +%Y%m%d)/"
}

rsyncmedia() {
  rsync -avh --progress --partial --delete "$1" "$2"
}

rsyncmirror() {
  rsync -avh --delete --progress "$1" "$2"
}

# rsyncremote /local/path/ user@remotehost:/remote/path/
rsyncremote() {
  rsync -avh --progress "$1" "$2"
}

rsyncdryrun() {
  rsync -avhn --progress "$1" "$2"
}
