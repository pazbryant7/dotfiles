if test -z "$DISPLAY"; and test (tty) = /dev/tty1; and status is-login
    startx
end

set -U fish_user_paths \
    ~/bin/global/ \
    ~/.cargo/bin/ \
    ~/.local/bin/ \
    ~/bin/crontab/ \
    /usr/local/bin/ \
    /var/lib/flatpak/exports/bin/ \
		~/.local/share/vim/mason/bin/
    ~/.local/share/nvim/mason/bin/ \
    ~/Documents/github/boilerplate/ \
    $fish_user_paths

# CUSTOM BINDS
# Bind Ctrl+L to the new function
bind \cl clear_and_redisplay

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

set -U fish_greeting
set -U fish_autosuggestion_enabled 0

# fish_config to config fish terminal
