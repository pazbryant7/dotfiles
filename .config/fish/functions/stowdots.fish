function stowdots --description "Restow dotfiles using GNU Stow from ~/Documents/github/dotfiles"
    set -l dotfiles_dir "$HOME/Documents/github/dotfiles"

    # Create the directory if it doesn't exist
    mkdir -p "$dotfiles_dir"
    if test $status -ne 0
        echo "Error: Could not create directory $dotfiles_dir" >&2
        return 1
    end

    # Change to the dotfiles directory
    cd "$dotfiles_dir"
    if test $status -ne 0
        echo "Error: Could not change to directory $dotfiles_dir" >&2
        return 1
    end

    # Run stow with optional extra args
    command stow --target="/home/$USER" --adopt --restow .

    cd - # get back to previous dir
    # the "." at the end it is important, because stow needs to know which files
    # you want to add to the "--target" folder. If not, then no dir nor file will
    # be symlinked
end
