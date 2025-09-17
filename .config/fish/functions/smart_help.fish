function smart_help
    set -l buffer (commandline)

    set -l cmd (string split ' ' -- $buffer)[1]

    if test -z "$cmd" -o -z "$buffer"
        return
    end

    if man -w "$cmd" >/dev/null 2>&1
        commandline "env MANPAGER='nvim +Man!' man $cmd"
        commandline -f execute
    else if command -v "$cmd" >/dev/null 2>&1
        commandline "$cmd --help | less -F"
        commandline -f execute
    else
        printf '\a'
    end
end
