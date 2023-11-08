# {{ enviroment variables

export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="st"
export SUDO_EDITOR=$EDITOR
export BROWSER="firefox-developer-edition"
export GTK_THEME="Nordic"
export READER="zathura"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export BAT_PAGER=$PAGER
export WM="bspwm"
export MANPAGER='nvim +Man!'
export QT_QPA_PLATFORMTHEME="qt5ct"  
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# }}

#{{ fzf

export FZF_DEFAULT_OPTS=" \
--color=bg+:#2e3440,bg:#4c566a,spinner:#bf616a,hl:#bf616a \
--color=fg:#d8dee9,header:#bf616a,info:#a3be8c,pointer:#bf616a \
--color=marker:#bf616a,fg+:#d8dee9,prompt:#a3be8c,hl+:#bf616a \
--preview-window noborder \
--height=50% \
"

export FZF_DEFAULT_COMMAND="fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"
#}}



#{{ nnn

export NNN_FIFO=/tmp/nnn.fifo
export NNN_TERMINAL="st"

# plugins
export NNN_PLUG='j:autojump;f:fzopen'

# bookmarks
export NNN_BMS="\
d:$HOME/Documents;\
w:$HOME/Pictures/wall;\
D:$HOME/Downloads/;\
"

# color
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
