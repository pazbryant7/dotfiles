# general
alias shutdown="shutdown now"
alias suspend="systemctl suspend"
alias :q="exit"
alias fontcache="sudo fc-cache -f -v"
alias rma="rm -rf"
alias rust-u="cargo install-update -a" # cargo install cargo-update needs to be installed
alias sudo="sudo "
alias sudoe="sudoedit"
alias u-all='paru -Syu && pipx upgrade-all && flatpak update && cargo install-update -a'
alias xevkeycode='xev | awk -F"[ )]+" "/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\\n\", \$5, \$8 }"'
alias vim="nvim --clean"
alias vi="nvim"
alias cl="clear; printf '\033[4 q'"
alias clear="clear; printf '\033[4 q'"

# apps
alias sapps=" pacman -Qen; pacman -Qm; pipx list; ls ~/.cargo/bin/; flatpak list"

# configuration files
alias aliases="nvim ~/zsh/.aliases.sh"
alias gtapps="z /usr/share/applications"
alias ck="nvim ~/.config/sxhkd/sxhkdrc"
alias cwm="nvim ~/.config/bspwm/bspwmrc"

# third party apps
alias lzg="lazygit"
alias lzd="lazydocker"

# zsh
alias czsh="nvim ~/zsh/.zshrc"
alias dzshh="rm ~/.zsh_history; rm ~/.history.db"
alias szsh="source ~/.zshrc"

# zoxide
alias ....="z ../../../../"
alias ...="z ../../../"
alias ..="z ../../"
alias .="z ../"
alias zb="z -"

# eza
alias lS="eza -1"                                                      # one column, just names
alias lsa="eza --oneline --all"                                        # all list
alias ll="eza -l --git"                                                # list, size, type, git
alias llm="eza -lbG --git --sort=modified"                             # long list, modified date sort
alias ls="eza --icons --git"                                           # ls
alias lt="eza --tree --level=2"                                        # tree
alias lx="eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale" # all + extended list

# ssh
alias sssh="bat ~/.ssh/config"

# tmux
alias tc="nvim ~/.tmux.conf"
alias ta="tmux attach"
alias td="tmux detach"
alias tk="tmux kill-server"
alias tn="tmux new -s main"

# zellij
alias ze="zellij"
alias zea="ze attach"
alias zen="ze --session main"
alias zek="zellij kill-all-sessions --yes"
alias zed="zellij delete-all-sessions --force"

# leetcode
alias leetcode="nvim leetcode.nvim"

# starting day
alias motivation="mpv ~/Videos/dios.mp4"

# st terminal
alias rel="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"

# update firefox theme
alias ufirefoxtheme='bash -c "$(curl -fsSL https://raw.githubusercontent.com/black7375/Firefox-UI-Fix/master/install.sh)"'

# youtube dl
alias ydl-music='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias ydl-music-playlist='yt-dlp -x --audio-format mp3 --audio-quality 0 --yes-playlist'
alias ydl-video='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
alias ydl-video-playlist='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --yes-playlist'

# grub
alias ugrup='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#git
alias gaa='git add --all'
alias gcmsg='git commit --message'
alias gco='git checkout'
alias gcup="git config --global user.name 'pazita117'; git config --global user.email 'plbryantt@outlook.com'"
alias gcuw="git config --global user.name 'Bryant Paz'; git config --global user.email 'plbryant@hotmail.com'"
alias gd='git diff'
alias gdc="git diff --cached"
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
alias ggpull='git pull origin "$(git branch --show-current)"'
alias ggpush='git push origin "$(git branch --show-current)"'
alias glg='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glga='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias gsb='git status --short --branch'

# himalaya 
alias hm="himalaya"
alias hmg="himalaya -a google-main"
alias hmw="himalaya -a microsoft-work"

# nvchad
alias nvchad="rm -rf ~/.local/share/nvim; rm -rf ~/.config/nvim; git clone https://github.com/plbryant/NvChad ~/.config/nvim --depth 1 && nvim"
