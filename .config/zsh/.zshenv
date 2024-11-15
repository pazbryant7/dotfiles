# {{ enviroment variables
export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="foot"
export SUDO_EDITOR=$EDITOR
export BROWSER="firefox"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export BAT_PAGER=$PAGER
export MANPAGER='nvim +Man!'
export GOPATH="/home/bryant/go/bin"
export CM_LAUNCHER="wofi"
export SXHKD_SHELL="zsh"
export GPG_TTY=$(tty)
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_SESSION_TYPE=auto
export EXPORT_OZONE_PLATFORM_HINT=auto
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# }}

#{{ fzf

export FZF_DEFAULT_OPTS=" \
--preview-window noborder \
--height=50%"


export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
#}}
