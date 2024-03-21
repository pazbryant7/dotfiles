# {{{ interactive

if status is-interactive
end

# }}}

# {{{ fish config

set fish_greeting
set fish_cursor_default underscore

bind \cn "forward-word"
bind \cp "backward-word"
bind \cd "get_pwd"
bind \en "accept-autosuggestion"
bind \ep "suppress-autosuggestion"

# }}}

# {{{ fish plugins

fzf_configure_bindings  --directory=\ct \
                        --git_status= \
                        --history= \
                        --variables= \
                        --processes= \
                        --git_log

# }}}

# {{{ extend path

fish_add_path /usr/local/bin/
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/bob/nvim-bin/
fish_add_path ~/.local/share/nvim/mason/bin
fish_add_path ~/bin/sh/
fish_add_path ~/go/bin/

# }}}

# {{{ start binariest config

atuin init fish | source
fnm env --use-on-cd | source
zoxide init fish | source

# }}}

# {{{ starship

set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
starship init fish --print-full-init | source
enable_transience

# }}}

# {{{ start Xorg with fish 

if status is-login
    if test (uname) = "Linux" -a -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# }}}
