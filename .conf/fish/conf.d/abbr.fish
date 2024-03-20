# fihs
abbr --add cf "z ~/.config/fish/; nvim config.fish"
abbr --add aliases "z ~/.config/fish/conf.d/; nvim abbr.fish"

# nvim
abbr --add vi "nvim --clean"
abbr --add ndk "nvim ~/.config/nvim/lua/core/mappings.lua"
abbr --add nck "nvim ~/.config/nvim/lua/custom/mappings.lua"

# general
abbr --add lk "xmodmap ~/.Xmodmap"
abbr --add rwm "bspc wm -r"
abbr --add rwmf "bspc quit"
abbr --add sp "systemctl suspend"
abbr --add sht "shutdown now"
abbr --add :q exit
abbr --add ck "nvim ~/.config/sxhkd/sxhkdrc"
abbr --add cl "clear; printf '\033[4 q'"
abbr --add clear "clear; printf '\033[4 q'"
abbr --add cwm "nvim ~/.config/bspwm/bspwmrc"
abbr --add dh "rm ~/.history.db; rm ~/.local/share/fish/fish_history"
abbr --add fontcache "sudo fc-cache -f -v"
abbr --add gtapps "z /usr/share/applications"
abbr --add motivation "mpv ~/Videos/dios.mp4"
abbr --add rel "xrdb merge ~/.Xresources && kill -USR1 (pidof st)"
abbr --add rma "rm -rf"
abbr --add sapps "pacman -Qen; pacman -Qm; pipx list; ls ~/.cargo/bin/; flatpak list"
abbr --add sssh "bat ~/.ssh/config"
abbr --add sudo "sudo "
abbr --add sudoe "sudoedit"
abbr --add u-all "paru -Syu && pipx upgrade-all && flatpak update && cargo install-update -a"
abbr --add ugrup "sudo grub-mkconfig -o /boot/grub/grub.cfg"
abbr --add updatefirefox "bash -c (curl -fsSL https://raw.githubusercontent.com/black7375/Firefox-UI-Fix/master/install.sh)"
abbr --add leetcode "nvim leetcode.nvim"

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
abbr --add gcup "git config --global user.name 'pazita117'; git config --global user.email 'plbryantt@outlook.com'"
abbr --add gcuw "git config --global user.name 'Bryant Paz'; git config --global user.email 'plbryant@hotmail.com'"
abbr --add gd "git diff"
abbr --add gdc "git diff --cached"
abbr --add gdcw "git diff --cached --word-diff"
abbr --add gds "git diff --staged"
abbr --add gdw "git diff --word-diff"
abbr --add ggpull "git pull origin (git branch --show-current)"
abbr --add ggpush "git push origin (git branch --show-current)"
abbr --add glg "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
abbr --add glga "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Crese' --stat"
abbr --add gsb "git status --short --branch"
abbr --add lzg "lazygit"

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
abbr --add td "tmux detach"
abbr --add tk "tmux kill-server"
abbr --add tn "tmux new -s main"
abbr --add tn2 "tmux new -s extra"
abbr --add tn3 "tmux new -s example"

# youtube
abbr --add ydl-music-playlist "yt-dlp -x --audio-format mp3 --audio-quality 0 --yes-playlist"
abbr --add ydl-music "yt-dlp -x --audio-format mp3 --audio-quality 0"
abbr --add ydl-video-playlist "yt-dlp -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' --yes-playlist"
abbr --add ydl-video "yt-dlp -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
