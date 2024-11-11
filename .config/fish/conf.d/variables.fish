# Environment variables
set -x EDITOR "nvim"
set -x VISUAL $EDITOR
set -x TERMINAL "st"
set -x SUDO_EDITOR $EDITOR
set -x BROWSER "firefox"
set -x READER "zathura"
set -x VIDEO "mpv"
set -x COLORTERM "truecolor"
set -x OPENER "xdg-open"
set -x PAGER "less"
set -x BAT_PAGER $PAGER
set -x WM "bspwm"
set -x MANPAGER "nvim +Man!"
set -x CM_LAUNCHER "rofi"
set -x SXHKD_SHELL "sh"

# FZF
set -Ux FZF_DEFAULT_OPTS "\
--preview-window noborder \
--height=50%"

set -x FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
