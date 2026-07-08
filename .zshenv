# {{ enviroment variables

export WM="dwm"
export LESS="FRSX"
export VIDEO="mpv"
export EDITOR="nvim"
export VISUAL=$EDITOR
export PAGER="less -R"
export TERMINAL="xterm"
export OPENER="xdg-open"
export CM_LAUNCHER="rofi"
export XDG_SESSION_TYPE=x11
export COLORTERM="truecolor"
export MANPAGER="$EDITOR +Man!"
export GOPATH="/home/bryant/go/bin"
export BROWSER="brave-origin-stable"
export XDG_CONFIG_HOME="$HOME/.config"
export SUDO_EDITOR="$HOME/.local/share/mise/shims/nvim"

# }}

#{{ fzf

export FZF_DEFAULT_OPTS=" \
--height=50% \
--preview-window noborder \
--bind 'ctrl-o:execute(xdg-open {})' \
"

export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=.git \
"

export QT_QPA_PLATFORMTHEME=qt6ct
