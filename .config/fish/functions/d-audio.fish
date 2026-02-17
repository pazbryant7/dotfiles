function d-audio --description "Download music from youtube"
  set -l url $argv[1]
  set -l cookie_file "$HOME/Downloads/cookies.txt"

  if test -z "$url"
      echo "Error: No URL provided."
      return 1
  end

  if test ! -f "$cookie_file"
      echo "Error: cookies.txt not found in ~/Downloads/"
      echo "Please place your cookies.txt file in: $cookie_file"
      return 1
  end

  echo "Downloading best audio quality from $url..."
  yt-dlp -f bestaudio \
      -x \
      --verbose \
      --add-metadata \
      --audio-quality 0 \
      --embed-thumbnail \
      --cookies "$cookie_file" \
      --js-runtimes bun:/usr/bin/bun \
      -o "%(artist)s - %(title)s.%(ext)s" \
      "$url"
end
