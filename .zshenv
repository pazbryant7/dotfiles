# {{ enviroment variables

export EDITOR="nvim"
export WM="dwm"
export LESS="FRSX"
export VIDEO="mpv"
export VISUAL=$EDITOR
export PAGER="less -R"
export TERMINAL="xterm"
export BROWSER="brave-origin-stable"
export SXHKD_SHELL="zsh"
export OPENER="xdg-open"
export CM_LAUNCHER="rofi"
export COLORTERM="truecolor"
export MANPAGER="$EDITOR +Man!"
export GOPATH="/home/bryant/go/bin"
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
