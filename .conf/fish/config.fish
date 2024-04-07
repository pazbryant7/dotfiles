# {{{ interactive

if status is-interactive
  printf '\033[4 q'
end

# }}}

# {{{ fish config

set fish_greeting
set fish_cursor_default underscore

# ctrl
bind \cn "forward-word"
bind \cp "backward-word"

# alt
bind \en "accept-autosuggestion"
bind \ep "suppress-autosuggestion"

# }}}

# {{{ aliases

alias sudo "sudo "
alias vi "NVIM_APPNAME='nvim' nvim"
alias vim "NVIM_APPNAME='nvchad' nvim"

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
