# fihs
abbr --add cf "z ~/.config/fish/; nvim config.fish"

# general
abbr --add sp "systemctl suspend"
abbr --add weather "wego"
abbr --add dh "rm ~/.history.db ~/.local/share/fish/fish_history"
abbr --add sht "shutdown now"
abbr --add ck "nvim ~/.config/sxhkd/sxhkdrc"
abbr --add cl "clear; printf '\033[4 q'"
abbr --add clear "clear; printf '\033[4 q'"
abbr --add cwm "nvim ~/.config/bspwm/bspwmrc"
abbr --add fontcache "sudo fc-cache -f -v"
abbr --add motivation "mpv ~/Videos/dios.mp4"
abbr --add rel "xrdb merge ~/.Xresources && kill -USR1 (pidof st)"
abbr --add rma "rm -rf"
abbr --add leetcode "nvim leetcode.nvim"
abbr --add cpass "z ~/.password-store/"
abbr --add als "nvim ~/.config/fish/conf.d/abbr.fish"
abbr --add xevk "xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"

# zoxide
abbr --add .... "z ../../../../"
abbr --add ... "z ../../../"
abbr --add .. "z ../../"
abbr --add . "z ../"
abbr --add zb "z -"

# git
abbr --add gb "git branch"
abbr --add gc "git commit"
abbr --add gaa "git add --all"
abbr --add gcmsg "git commit --message"
abbr --add gco "git checkout"
abbr --add gcup "git config --global user.name 'bryantpaz'; git config --global user.email 'pazbryant7@outlook.com'"
abbr --add gcuw "git config --global user.name 'pazbryant'; git config --global user.email 'bryantpaz7@outlook.com'"
abbr --add gd "git diff"
abbr --add gdc "git diff --cached"
abbr --add ggpull "git pull origin (git branch --show-current)"
abbr --add ggpush "git push origin (git branch --show-current)"
abbr --add glg "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr --add glga "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Crese' --stat"
abbr --add gsb "git status --short --branch"
abbr --add lzg "lazygit"

# notes
abbr --add sn "git commit -m 'update notes'"

# docker
abbr --add lzd "lazydocker"
abbr --add start-docker "sudo systemctl start docker.socket"

# mongo
abbr --add start-mongo "sudo systemctl start mongodb.service"

# postgres
abbr --add start-postgres "sudo systemctl start postgresql.service"

# himalaya
abbr --add hm "himalaya"
abbr --add hmg "himalaya -a google-main"
abbr --add hmw "himalaya -a microsoft-work"

# elsa
abbr --add ls "eza --icons --group --group-directories-first"
abbr --add ll "eza --group --header --group-directories-first --long --all"
abbr --add lg "eza --group --header --group-directories-first --long --git --git-ignore"                                    
abbr --add lt "eza --group --header --group-directories-first --tree --level=2"                                    
abbr --add lsa "eza --oneline --all"
  
# tmux
abbr --add ta "tmux attach"
abbr --add tc "nvim ~/.tmux.conf"
abbr --add tk "tmux kill-server"
abbr --add tn "tmux new -s $USER"
