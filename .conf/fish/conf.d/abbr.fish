# fihs
abbr --add cf "z ~/.config/fish/; nvim config.fish"

# general
abbr --add sp "systemctl suspend"
abbr --add weather "wego"
abbr --add dh "rm ~/.history.db ~/.local/share/fish/fish_history"
abbr --add sht "shutdown now"
abbr --add clear "clear; printf '\033[4 q'"
abbr --add ck "nvim ~/.config/sxhkd/sxhkdrc"
abbr --add cwm "nvim ~/.config/bspwm/bspwmrc"
abbr --add fontcache "sudo fc-cache -f -v"
abbr --add motivation "mpv ~/mega/personal/pc/videos/biy/dios.mp4"
abbr --add rel "xrdb merge ~/.Xresources && kill -USR1 (pidof st)"
abbr --add rma "rm -rf"
abbr --add leetcode "nvim leetcode.nvim"
abbr --add xevk "xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
abbr --add awake "xset -dpms"

# zoxide
abbr --add .... "z ../../../../"
abbr --add ... "z ../../../"
abbr --add .. "z ../../"
abbr --add . "z ../"
abbr --add zb "z -"

# git
abbr --add glg "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr --add glga "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Crese' --stat"
abbr --add gsb "git status --short --branch"
abbr --add lzg "lazygit"

abbr --add set-git-personal "git config --global user.name 'bryantpaz'; git config --global user.email 'pazbryant7@outlook.com'"
abbr --add set-git-work "git config --global user.name 'pazbryant'; git config --global user.email 'bryantpaz7@outlook.com'"

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

# himalaya
abbr --add hm "himalaya"

# tmux
abbr --add ta "tmux attach"
abbr --add tc "nvim ~/.tmux.conf"
abbr --add tk "tmux kill-server"
abbr --add tn "tmux new -s $USER"

# open vpn
abbr --add openvpn-japan "sudo openvpn /etc/openvpn/client/jp-free-127011.protonvpn.udp.ovpn"
abbr --add openvpn-us "sudo openvpn /etc/openvpn/client/us-free-111014.protonvpn.udp.ovpn"
