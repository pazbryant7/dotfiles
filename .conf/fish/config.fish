# {{{ interactive

if status is-interactive
  printf '\033[4 q'
end

# }}}

# {{{ fish config

set fish_greeting
set fish_cursor_default underscore
set fish_color_valid_path --no-underline

# }}}

# {{{ aliases

alias cl "clear"
alias yay "paru"
alias sudo "sudo "
alias pass "gopass"
alias bandwhich "sudo bandwhich"
alias vi "NVIM_APPNAME='minimal' nvim"

# }}}

# {{{ extend path

fish_add_path /usr/local/bin/
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/bob/nvim-bin/
fish_add_path ~/.local/share/nvim/mason/bin
fish_add_path ~/.local/share/ide/mason/bin
fish_add_path ~/bin/sh/
fish_add_path ~/bin/lua/
fish_add_path ~/bin/rofi/
fish_add_path ~/bin/golang/
fish_add_path ~/go/bin/

# }}}

# {{{ fzf

fzf --fish | source

bind \cp fzf-file-widget
bind \cy fzf-cd-widget

# }

# {{{ start binariest config

atuin init fish | source
fnm env --use-on-cd | source
zoxide init --cmd cd fish | source

# }}}

# {{{ start Xorg with fish 

if status is-login
    if test (uname) = "Linux" -a -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# }}}
