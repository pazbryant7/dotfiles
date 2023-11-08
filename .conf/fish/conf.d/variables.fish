# Environment variables
set -x EDITOR "nvim"
set -x VISUAL $EDITOR
set -x TERMINAL "st"
set -x SUDO_EDITOR $EDITOR
set -x BROWSER "firefox-developer-edition"
set -x GTK_THEME "Nordic"
set -x READER "zathura"
set -x VIDEO "mpv"
set -x COLORTERM "truecolor"
set -x OPENER "xdg-open"
set -x PAGER "less"
set -x BAT_PAGER $PAGER
set -x WM "bspwm"
set -x MANPAGER "nvim +Man!"
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x STARSHIP_CONFIG "~/.config/starship/starship.toml"
set -gx LS_COLORS (dircolors -c ~/.dir_colors | string split ' ')[3]

# FZF
set -x FZF_DEFAULT_OPTS " \
--color=bg+:#2e3440,bg:#4c566a,spinner:#bf616a,hl:#bf616a \
--color=fg:#d8dee9,header:#bf616a,info:#a3be8c,pointer:#bf616a \
--color=marker:#bf616a,fg+:#d8dee9,prompt:#a3be8c,hl+:#bf616a \
--preview-window noborder \
--height=50% \
"

set -x FZF_DEFAULT_COMMAND "fd \
  --type f \
  --strip-cwd-prefix \
  --hidden \
  --follow \
  --exclude=git"

# nnn
set -x NNN_FIFO "/tmp/nnn.fifo"
set -x NNN_TERMINAL "st"

# Plugins
set -x NNN_PLUG 'j:autojump;f:fzopen'

# Bookmarks
set -x NNN_BMS "\
d:$HOME/Documents;\
w:$HOME/Pictures/wall;\
D:$HOME/Downloads/;\
"

# Color
set BLK "0B"; set CHR "0B"; set DIR "04"; set EXE "06"; set REG "00"; set HARDLINK "06"; set SYMLINK "06"; set MISSING "00"; set ORPHAN "09"; set FIFO "06"; set SOCK "0B"; set OTHER "06"
set -x NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# Skim
set -x SKIM_DEFAULT_COMMAND "fd \
  --type f \
  "
