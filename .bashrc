# Environment variables
export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERMINAL="st"
export SUDO_EDITOR="$EDITOR"
export BROWSER="firefox-developer-edition"
export GTK_THEME="Dracula"
export READER="zathura"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export BAT_PAGER="$PAGER"
export WM="bspwm"
export MANPAGER="nvim +Man!"
export QT_QPA_PLATFORMTHEME="qt5ct"
export STARSHIP_CONFIG="~/.config/starship/starship.toml"

# FZF
export FZF_DEFAULT_OPTS=" \
--preview-window noborder \
--height=50%"

export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"

