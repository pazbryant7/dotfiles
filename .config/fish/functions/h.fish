function h
    if not set -q TMUX
        echo "Not in a tmux session."
        return 1
    end

    set tmux_current_pane_path (tmux display-message -p '#{pane_current_path}')
    if test $status -ne 0
        return 1
    end

    set tmux_current_session_path (tmux display-message -p '#{session_path}')
    if test $status -ne 0
        return 1
    end

    if test "$tmux_current_pane_path" = "$tmux_current_session_path"
        tmux display-message "You are already in your session root directory"
        return 0
    end

    cd "$tmux_current_session_path"
    if test $status -ne 0
        tmux display-message "Error: Could not change to session root: $tmux_current_session_path"
        return 1
    end
end
