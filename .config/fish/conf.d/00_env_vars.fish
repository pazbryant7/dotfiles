set -gx EDITOR "$HOME/.local/share/bob/nvim-bin/nvim"

set -gx WM dwm
set -gx VIDEO mpv
set -gx LESS FRSX
set -gx TERMINAL xterm
set -gx BROWSER firefox
set -gx OPENER xdg-open
set -gx PAGER "less -R"
set -gx VISUAL "$EDITOR"
set -gx CM_LAUNCHER rofi
set -gx SXHKD_SHELL fish
set -gx COLORTERM truecolor
set -gx SUDO_EDITOR "$EDITOR"
set -gx MANPAGER "$EDITOR +Man!"
set -gx GOPATH /home/bryant/go/bin
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx STARSHIP_CONFIG "/home/bryant/.config/starship/starship.toml"

set -gx FZF_DEFAULT_OPTS "\
--height=50% \
--preview-window noborder \
--bind 'ctrl-o:execute(xdg-open {})' \
--bind 'ctrl-x:execute(xdg-default {})' \
--bind 'ctrl-u:execute($HOME/bin/tmux/new-session {} working)' \
"

set -gx FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=.git \
"

set -gx QT_QPA_PLATFORMTHEME qt6ct
