# NOTE: this function is used in ~/.zshconfig file
# is attached to ^L keybind
function clear-and-redisplay
    printf '\033[2J\033[3J\033[H'
    commandline -f repaint
end
