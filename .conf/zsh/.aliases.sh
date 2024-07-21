# main
alias cl="clear"
alias yay="paru"
alias sudo="sudo "
alias pass="gopass"
alias bandwhich="sudo bandwhich"
alias vi="NVIM_APPNAME='minimal' nvim"

alias ls="eza --icons --group --group-directories-first"
alias ll="eza --group --header --group-directories-first --long --all"
alias lg="eza --group --header --group-directories-first --long --git --git-ignore"
alias lt="eza --group --header --group-directories-first --tree --level=2"
alias lsa="eza --oneline --all"

# fihs
alias cf="vi ~/.config/fish/config.fish"
alias czsh="vi ~/.zshrc"
alias sp="systemctl suspend"
alias weather="wego"
alias dh="rm ~/.history.db; ~/.local/share/fish/fish_history;"
alias sht="shutdown now"
alias clear="clear; printf '\033[4 q'"
alias ck="vi ~/.config/sxhkd/sxhkdrc"
alias cwmy"vi ~/.config/bspwm/bspwmrc"
alias fontcache="sudo fc-cache -f -v"
alias motivation="mpv ~/mega/personal/pc/videos/biy/dios.mp4"
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"
alias rma="rm -rf"
alias leetcode="vi leetcode.vi"
alias ff="fastfetch"
alias sudoe="sudoedit"

# zoxide
alias .="cd ../"
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"

alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glga="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Crese' --stat"
alias gsb="git status --short --branch"
alias lzg="lazygit"
alias gdc="git diff --cached"
alias gd="git diff"
alias gaa="git add -A"
alias gc="git commit"

alias git-personal="git config --global user.name 'bryantpaz'; git config --global user.email 'pazbryant7@outlook.com'"
alias git-work="git config --global user.name 'pazbryant'; git config --global user.email 'bryantpaz7@outlook.com'"

alias lzd="lazydocker"
alias docker-start="sudo systemctl start docker.socket"
alias docker-stop="sudo systemctl stop docker.socket"

alias mongo-start="sudo systemctl start mongodb.service"
alias mongo-stop="sudo systemctl stop mongodb.service"

alias postgres-start="sudo systemctl start postgresql.service"
alias postgres-stop="sudo systemctl stop postgresql.service"

alias ta="tmux attach"
alias tc="vi ~/.tmux.conf"
alias tk="tmux kill-server"
alias tn='tmux new -s $USER'

alias openvpn-japan="sudo openvpn /etc/openvpn/client/jp-free-127011.protonvpn.udp.ovpn"
alias openvpn-us="sudo openvpn /etc/openvpn/client/us-free-111014.protonvpn.udp.ovpn"
