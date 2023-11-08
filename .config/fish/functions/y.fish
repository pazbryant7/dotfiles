function y --description "Open Yazi file manager and cd to its last path on exit"
    # Create a temporary file to store Yazi's cwd
    set -l tmp_cwd_file (mktemp -t "yazi-cwd.XXXXXX")

    # Run Yazi, passing all arguments ($argv) and the cwd-file option
    command yazi $argv --cwd-file="$tmp_cwd_file"

    # Check if the temporary file exists and is not empty
    if test -f "$tmp_cwd_file"; and test -s "$tmp_cwd_file"
        set -l target_cwd (cat -- "$tmp_cwd_file")

        # If a valid cwd was written and it's different from the current directory, cd to it
        if test -n "$target_cwd"; and test "$target_cwd" != "$PWD"
            cd -- "$target_cwd"
        end
    end

    # Clean up the temporary file
    rm -f -- "$tmp_cwd_file"
end
