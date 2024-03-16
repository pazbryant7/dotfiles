# Environment variables
set -x EDITOR "nvim"
set -x VISUAL $EDITOR
set -x TERMINAL "st"
set -x SUDO_EDITOR $EDITOR
set -x BROWSER "firefox-developer-edition"
set -x GTK_THEME "Nordic"
set -x READER "zathura"
set -x VIDEO "mpv"
set -x COLORTERM "truecolor"
set -x OPENER "xdg-open"
set -x PAGER "less"
set -x BAT_PAGER $PAGER
set -x WM "bspwm"
set -x MANPAGER "nvim +Man!"
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x STARSHIP_CONFIG "~/.config/starship/starship.toml"

# FZF
set -x FZF_DEFAULT_OPTS " \
--color=bg+:#1a1a1a,bg:#303030,spinner:#ffb6b9,hl:#ffb6b9 \
--color=fg:#d8dee9,header:#ffb6b9,info:#b48ead,pointer:#ffb6b9 \
--color=marker:#ffb6b9,fg+:#d8dee9,prompt:#b48ead,hl+:#ffb6b9 \
--preview-window noborder \
--height=50%"

set -x FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
