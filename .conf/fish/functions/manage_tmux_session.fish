function manage_tmux_session --description 'Create a new tmux session with a unique name using animal names'
    # Check if tmux is installed
    if not type -q tmux
        # If tmux is not installed, do nothing
        return
    end

    # Check if already inside a tmux session
    if test -n "$TMUX"
        # If inside a tmux session, do nothing
        return
    end

    # Define an array of animal names
    set -l animals "lion" "tiger" "bear" "eagle" "shark" "wolf" "falcon" "panther" "leopard" "cheetah"
    
    # Initialize a session name
    set -l session_name ""

    # Loop through the animal names to find an available session name
    for animal in $animals
        set session_name "$USER"_session_$animal
        if not tmux has-session -t $session_name 2>/dev/null
            break
        end
    end

    # If all animal names are taken, fallback to creating a new session with a random name
    if test -z "$session_name"
        set session_name "$USER"_session_$RANDOM
    end

    # Create a new tmux session with the unique session name
    tmux new-session -s $session_name
end
