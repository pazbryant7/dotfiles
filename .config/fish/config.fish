if test -z "$DISPLAY"; and test (tty) = /dev/tty1; and status is-login
    startx
end

set -U fish_user_paths \
    ~/bin/global/ \
    ~/.local/bin/ \
    ~/.cargo/bin/ \
    ~/bin/crontab/ \
    /usr/local/bin/ \
    ~/.local/share/bob/nvim-bin/ \
    /var/lib/flatpak/exports/bin/ \
    ~/.local/share/nvim/mason/bin/ \
    ~/Documents/github/boilerplate/

# CUSTOM BINDS
bind alt-h smart-help
bind ctrl-l clear-and-redisplay

# DEFAULT FISH
set -U fish_greeting
set -U fish_autosuggestion_enabled 0


if command -v fzf >/dev/null
    fzf --fish | source
end

if command -v atuin >/dev/null
    atuin init fish | source
end

if command -v starship >/dev/null
    starship init fish | source
end

if command -v fnm >/dev/null
    fnm env --shell fish --use-on-cd | source
end

if command -v zoxide >/dev/null
    zoxide init fish | source
end

# --- Custom Plugin Manager ---
# Define the list of plugins to install (user/repo format)
set -g fish_plugins \
    'jorgebucaran/autopair.fish'

# Load the plugins from the list above
plugin load

if status --is-interactive
    stty -ixon
    stty susp undef
    set -gx GPG_TTY (tty)
end
