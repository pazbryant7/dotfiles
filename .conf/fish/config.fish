# {{{ interactive

if status is-interactive
  printf '\033[4 q'
end

# }}}

# {{{ fish config

set fish_greeting
set fish_cursor_default underscore

set fish_color_valid_path --no-underline

set fish_pager_color_selected_background none

set fish_pager_color_selected_completion blue --bold
set fish_pager_color_selected_prefix blue --bold

# ctrl
bind \en "forward-word"
bind \ep "backward-word"

# alt
bind \cn "accept-autosuggestion"
bind \cp "suppress-autosuggestion"

# }}}

# {{{ aliases

alias sudo "sudo "
alias bandwhich "sudo bandwhich"
alias vi "NVIM_APPNAME='ide' nvim"
alias yz "yazi"
alias cl "clear"

alias ls "eza --icons --group --group-directories-first"
alias ll "eza --group --header --group-directories-first --long --all"
alias lg "eza --group --header --group-directories-first --long --git --git-ignore"                                    
alias lt "eza --group --header --group-directories-first --tree --level=2"                                    
alias lsa "eza --oneline --all"

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
fish_add_path ~/bin/crontab/
fish_add_path ~/go/bin/

# }}}

# {{{ start binariest config

atuin init fish | source
fnm env --use-on-cd | source
zoxide init --cmd cd fish | source

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
