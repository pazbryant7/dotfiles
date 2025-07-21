# This function handles loading and updating plugins
function plugin
    set -q plugins_dir; or set -g plugins_dir ~/.config/fish/plugins

    switch "$argv[1]"
        case load
            for repo in $fish_plugins
                set repo_name (string split -r -m 1 / "$repo")[2]
                set plug_dir "$plugins_dir/$repo_name"

                if not test -d "$plug_dir"
                    echo "Cloning $repo..."
                    git clone -q --depth 1 "https://github.com/$repo" "$plug_dir"
                end

                set functions_dir "$plug_dir/functions"
                if test -d "$functions_dir"
                    contains "$functions_dir" $fish_function_path; or set -p fish_function_path "$functions_dir"
                end

                set plug_name (string replace .fish '' "$repo_name")
                set entry_point "$plug_dir/conf.d/$plug_name.fish"
                if test -f "$entry_point"
                    source "$entry_point"
                else
                    echo >&2 "Error: Could not find an entry point for '$repo'."
                end
            end

        case update
            for d in "$plugins_dir"/*
                if test -d "$d/.git"
                    set plug_name (basename "$d")
                    echo "Updating $plug_name..."
                    command git -C "$d" pull --ff --rebase
                end
            end

        case '*'
            echo "Usage: plugin [load | update]"
    end
end
