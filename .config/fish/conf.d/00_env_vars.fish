set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"
set -gx TERMINAL xterm
set -gx SUDO_EDITOR "$EDITOR"
set -gx BROWSER firefox
set -gx VIDEO mpv
set -gx COLORTERM truecolor
set -gx OPENER xdg-open
set -gx PAGER bat
set -gx WM dwm
set -gx MANPAGER 'nvim +Man!'
set -gx GOPATH /home/bryant/go/bin
set -gx CM_LAUNCHER rofi
set -gx SXHKD_SHELL fish
set -gx STARSHIP_CONFIG "/home/bryant/.config/starship/starship.toml"
set -gx XDG_CONFIG_HOME "$HOME/.config"

set -gx FZF_DEFAULT_OPTS "\
--height=50% \
--preview-window noborder \
--bind 'ctrl-o:execute(xdg-open {})' \
--bind 'ctrl-x:execute(xdg-default {})' \
--bind 'ctrl-u:execute($HOME/bin/tmux/tmux-new-session {} working)' \
"

set -gx FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=.git \
"

set -gx QT_QPA_PLATFORMTHEME qt6ct

if status --is-interactive
    stty -ixon
    stty susp undef
    set -gx GPG_TTY (tty)
end
