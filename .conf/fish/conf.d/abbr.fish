# fihs
abbr --add cf "vi ~/.config/fish/config.fish"

# zsh
abbr --add czsh "vi ~/.zshrc"

# general
abbr --add sp "systemctl suspend"
abbr --add weather "wego"
abbr --add dh "rm ~/.history.db"
abbr --add sht "shutdown now"
abbr --add clear "clear; printf '\033[4 q'"
abbr --add ck "vi ~/.config/sxhkd/sxhkdrc"
abbr --add cwm "vi ~/.config/bspwm/bspwmrc"
abbr --add fontcache "sudo fc-cache -f -v"
abbr --add motivation "mpv ~/mega/personal/pc/videos/biy/dios.mp4"
abbr --add rel "xrdb merge ~/.Xresources && kill -USR1 (pidof st)"
abbr --add rma "rm -rf"
abbr --add leetcode "vi leetcode.nvim"
abbr --add ff "fastfetch"
abbr --add sudoe "sudoedit"
abbr --add transes "trans en:es"
abbr --add cheat "cht.sh"

# zoxide
abbr --add . "cd ../"
abbr --add .. "cd ../../"
abbr --add ... "cd ../../../"
abbr --add .... "cd ../../../../"

# git
abbr --add glg "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr --add glga "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Crese' --stat"
abbr --add gsb "git status --short --branch"
abbr --add lzg "lazygit"
abbr --add gdc "git diff --cached"
abbr --add gd "git diff"
abbr --add gaa "git add -A"
abbr --add gc "git commit"

abbr --add git-personal "git config --global user.name 'bryantpaz'; git config --global user.email 'pazbryant7@outlook.com'"
abbr --add git-work "git config --global user.name 'pazbryant'; git config --global user.email 'bryantpaz7@outlook.com'"

# docker
abbr --add lzd "lazydocker"
abbr --add docker-start "sudo systemctl start docker.socket"
abbr --add docker-stop "sudo systemctl stop docker.socket"

# mongo
abbr --add mongo-start "sudo systemctl start mongodb.service"
abbr --add mongo-stop "sudo systemctl stop mongodb.service"

# postgres
abbr --add postgres-start "sudo systemctl start postgresql.service"
abbr --add postgres-stop "sudo systemctl stop postgresql.service"

# tmux
abbr --add ta "tmux attach"
abbr --add tc "vi ~/.tmux.conf"
abbr --add tk "tmux kill-server"
abbr --add tn "tmux new -s $USER"

# open vpn
abbr --add openvpnjapan "sudo openvpn /etc/openvpn/client/jp-free-127011.protonvpn.udp.ovpn"
abbr --add openvpnus "sudo openvpn /etc/openvpn/client/us-free-111014.protonvpn.udp.ovpn"
