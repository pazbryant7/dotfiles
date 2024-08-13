# main
abbr --add :q "exit"
abbr --add cl "clear"
abbr --add sudo "sudo "
abbr --add pass "gopass"
abbr --add transes "trans en:es"
abbr --add vi "NVIM_APPNAME 'minimal' nvim"

# default
abbr --add sp "systemctl suspend"
abbr --add dh "rm ~/.history.db"
abbr --add sht "shutdown now"
abbr --add clear "clear; printf '\033[4 q'"
abbr --add fontcache "sudo fc-cache -f -v"
abbr --add cristiano "mpv ~/mega/personal/pc/videos/biy/dios.mp4"
abbr --add rel "xrdb merge ~/.Xresources && kill -USR1 \$(pidof st)"
abbr --add leetcode "vi leetcode.vi"
abbr --add ff "fastfetch"

# git
abbr --add gb "git branch"
abbr --add glg "git log --graph --pretty '%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr --add gsb "git status --short --branch"
abbr --add lzg "lazygit"
abbr --add gdc "git diff --cached"
abbr --add gd "git diff"
abbr --add gco "git checkout"
abbr --add gaa "git add -A"
abbr --add gc "git commit"
abbr --add ggpush 'git push origin $(git rev-parse --abbrev-ref HEAD)'
abbr --add ggpull 'git pull origin $(git rev-parse --abbrev-ref HEAD)'

# tmux
abbr --add ta "tmux attach"
abbr --add tc "vi ~/.tmux.conf"
abbr --add tk "tmux kill-server"
abbr --add tn 'tmux new -s $USER'

# docker
abbr --add tachidesk 'cd ~/documents/github/tachidesk && docker compose start'
abbr --add lzd "lazydocker"
