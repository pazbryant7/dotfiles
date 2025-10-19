# override defaults
alias cd='z'
alias ls='eza'
alias cdi='zi'

# main
alias ls="ls"
alias :q="exit"
alias cl="clear"
alias xr="vi ~/.Xresources"
alias v="NVIM_APPNAME='vim' nvim"
alias leetcode="nvim leetcode.nvim"
alias zsha="cd ~/zsh && vi aliases"
alias c="xclip -selection clipboard"
alias zshc="cd ~/zsh && vi zshconfig"
alias vi="env NVIM_APPNAME='vim' nvim"
alias p="xclip -selection clipboard -o"
alias fishc="cd ~/.config/fish && vi config.fish"
alias rex="xrdb -remove && xrdb -merge ~/.Xresources && kill -USR1 \$(pidof st)"

# system
alias sht="shutdown now"
alias sp="systemctl suspend"
alias rebootcmd="systemctl reboot"
alias fontcache="sudo fc-cache -f -v"
