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
--color=bg+:#393552,bg:#191724,spinner:#eb6f92,hl:#eb6f92 \
--color=fg:#c7aed6,header:#eb6f92,info:#b58da6,pointer:#eb6f92 \
--color=marker:#eb6f92,fg+:#c7aed6,prompt:#b58da6,hl+:#eb6f92 \
--preview-window noborder \
--height=50%"

set -x FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
