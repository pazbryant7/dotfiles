# NOTE: this function is used in ~/.zshconfig file
# is attached to ^L keybind
function clear-and-redisplay
    clear
    commandline -f repaint
end
