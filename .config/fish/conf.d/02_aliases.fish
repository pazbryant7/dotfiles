# override defaults
alias cd='z'
alias ls='eza'
alias cdi='zi'

# main

alias g="git"
alias :q="exit"
alias cl="clear"
alias vi="nvim --noplugin"
alias zshc="nvim ~/.zshrc"
alias xr="nvim ~/.Xresources"
alias jjh="jj bookmark set main"
alias leetcode="nvim leetcode.nvim"
alias c="xclip -selection clipboard"
alias p="xclip -selection clipboard -o"
alias zsha="cd ~/zsh && nvim --noplugin aliases"
alias fishc="cd ~/.config/fish && nvim --noplugin config.fish"
alias alac="nvim --noplugin ~/.config/alacritty/alacritty.toml"
alias rex="xrdb -remove && xrdb -merge ~/.Xresources && kill -USR1 \$(pidof st)"

# system
alias sht="shutdown now"
alias sp="systemctl suspend"
alias rbt="systemctl reboot"
alias fontcache="sudo fc-cache -f -v"
