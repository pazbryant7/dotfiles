function ignore
    if test (count $argv) -eq 0
        echo "Usage: ignore language1,language2,..."
        echo "Example: ignore node,python"
        return 1
    end

    # Combine all arguments into a comma-separated string
    set languages (string join , $argv)

    # Fetch the .gitignore template from gitignore.io
    curl -L -s "https://www.gitignore.io/api/$languages"
end
