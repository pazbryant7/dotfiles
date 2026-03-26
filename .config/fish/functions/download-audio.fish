function download-audio
    set -l url ""
    set -l mp3 false
    set -l cookie_file "$HOME/Downloads/cookies.txt"

    for arg in $argv
        switch $arg
            case -m --mp3
                set mp3 true
            case '-*'
                echo "Error: Unknown flag '$arg'"
                return 1
            case '*'
                set url $arg
        end
    end

    if test -z "$url"
        echo "Error: No URL provided."
        echo "Usage: download-audio [--mp3] <url>"
        return 1
    end

    if not test -f "$cookie_file"
        echo "Error: cookies.txt not found in ~/Downloads/"
        echo "Please place your cookies.txt file in: $cookie_file"
        return 1
    end

    set -l extra_args

    if $mp3
        echo "Downloading as MP3 from $url..."
        set extra_args --audio-format mp3
    else
        echo "Downloading best audio quality from $url..."
    end

    yt-dlp -f bestaudio \
        -x \
        --verbose \
        --add-metadata \
        --audio-quality 0 \
        --embed-thumbnail \
        --cookies "$cookie_file" \
        --js-runtimes bun:/usr/bin/bun \
        -o "%(title)s.%(ext)s" \
        $extra_args \
        "$url"
end
