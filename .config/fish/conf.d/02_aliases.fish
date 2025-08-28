# main
alias ls="ls"
alias cl="clear"
alias :q="exit"
alias zsha="cd ~/zsh && vi aliases"
alias xresources="vi ~/.Xresources"
alias c="xclip -selection clipboard"
alias vi="env NVIM_APPNAME='vim' nvim"
alias zshc="cd ~/zsh && vi zshconfig"
alias p="xclip -selection clipboard -o"
alias fishc="cd ~/.config/fish && vi config.fish"
alias rex="xrdb -remove && xrdb -merge ~/.Xresources && kill -USR1 \$(pidof st)"

# system
alias sht="shutdown now"
alias sp="systemctl suspend"
alias rebootcmd="systemctl reboot"
alias fontcache="sudo fc-cache -f -v"
