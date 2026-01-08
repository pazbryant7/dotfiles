function ytdl --description "Download music with ytdlp"
    set -l url $argv[1]
    set -l cookies_file $argv[2]

    yt-dlp \
        --cookies "$cookies_file" \
        --js-runtimes bun:/usr/bin/bun \
        --remote-components ejs:github \
        -f bestaudio \
        -x \
        --audio-format m4a \
        --audio-quality 0 \
        -o "%(title)s.%(ext)s" \
        --embed-metadata \
        --embed-thumbnail \
        --ppa "ffmpeg:-c:a aac -b:a 320k" \
        $url
end
