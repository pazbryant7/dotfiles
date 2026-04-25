# override defaults
alias cd='z'
alias ls='eza'
alias cdi='zi'

# weather
alias weather='curl -s "wttr.in/Tecoh,Yucatan"'

# main

alias :q="exit"
alias cl="clear"
alias name="generate_name"
alias zshc="nvim ~/.zshrc"
alias xr="nvim ~/.Xresources"
alias jjh="jj bookmark set main"
alias leetcode="nvim leetcode.nvim"
alias c="xclip -selection clipboard"
alias p="xclip -selection clipboard -o"
alias zsha="cd ~/zsh && nvim aliases"
alias fishc="cd ~/.config/fish && nvim config.fish"
alias alac="nvim ~/.config/alacritty/alacritty.toml"
alias rex="xrdb -remove && xrdb -merge ~/.Xresources && kill -USR1 \$(pidof st)"

alias opencode="bunx --bun opencode-ai"

alias btm="btm --basic"

# system
alias sht="shutdown now"
alias sp="systemctl suspend"
alias rbt="systemctl reboot"
alias fontcache="sudo fc-cache -f -v"
