# {{ enviroment variables

export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="st"
export SUDO_EDITOR=$EDITOR
export BROWSER="firefox-developer-edition"
export GTK_THEME="Nordic"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export DELTA_PAGER="less -R"
export BAT_PAGER=$PAGER
export WM="bspwm"
export MANPAGER='nvim +Man!'
export QT_QPA_PLATFORMTHEME="qt5ct"  
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export GOPATH="/home/bryant/go/bin"
export CM_LAUNCHER="rofi"
export SXHKD_SHELL="sh"

# }}

#{{ fzf

export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--preview-window noborder \
--height=50%"


export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
#}}
