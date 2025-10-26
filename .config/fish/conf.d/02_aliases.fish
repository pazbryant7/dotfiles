# override defaults
alias cd='z'
alias ls='eza'
alias cdi='zi'

# main
alias ls="ls"
alias :q="exit"
alias cl="clear"
alias xr="nvim ~/.Xresources"
alias leetcode="nvim leetcode.nvim"
alias zsha="cd ~/zsh && nvim aliases"
alias c="xclip -selection clipboard"
alias zshc="cd ~/zsh && nvim zshconfig"
alias p="xclip -selection clipboard -o"
alias fishc="cd ~/.config/fish && nvim config.fish"
alias rex="xrdb -remove && xrdb -merge ~/.Xresources && kill -USR1 \$(pidof st)"

# system
alias sht="shutdown now"
alias sp="systemctl suspend"
alias rebootcmd="systemctl reboot"
alias fontcache="sudo fc-cache -f -v"
