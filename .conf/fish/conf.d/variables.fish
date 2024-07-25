# Environment variables
set -x EDITOR "nvim"
set -x VISUAL $gDITOR
set -x TERMINAL "st"
set -x SUDO_EDITOR $EDITOR
set -x BROWSER "firefox-developer-edition"
set -x READER "zathura"
set -x VIDEO "mpv"
set -x COLORTERM "truecolor"
set -x OPENER "xdg-open"
set -x PAGER "less"
set -x BAT_PAGER $PAGER
set -x DELTA_PAGER "less -R"
set -x WM "bspwm"
set -x MANPAGER "nvim +Man!"
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x GOPATH "/home/bryant/go/bin"
set -x CM_LAUNCHER "rofi"
set -x SXHKD_SHELL "sh"
set -x CHTSH_QUERY_OPTIONS "style=perldoc"

# FZF
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--preview-window noborder \
--height=50%"

set -x FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
