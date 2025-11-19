# {{ enviroment variables

export EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"

export WM="dwm"
export LESS="FRSX"
export VIDEO="mpv"
export GPG_TTY=$(tty)
export VISUAL=$EDITOR
export PAGER="less -R"
export TERMINAL="xterm"
export BROWSER="firefox"
export SXHKD_SHELL="zsh"
export OPENER="xdg-open"
export CM_LAUNCHER="rofi"
export SUDO_EDITOR=$EDITOR
export COLORTERM="truecolor"
export MANPAGER="$EDITOR +Man!"
export GOPATH="/home/bryant/go/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="/home/bryant/.config/starship/starship.toml"

# }}

#{{ fzf

export FZF_DEFAULT_OPTS=" \
--height=50% \
--preview-window noborder \
--bind 'ctrl-o:execute(xdg-open {})' \
--bind 'ctrl-x:execute(xdg-default {})' \
--bind 'ctrl-u:execute($HOME/bin/tmux/new-session {} working)' \
"

export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=.git \
"

export QT_QPA_PLATFORMTHEME=qt6ct
