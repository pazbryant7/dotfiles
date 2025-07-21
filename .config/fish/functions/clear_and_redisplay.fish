# NOTE: this function is used in ~/.zshconfig file
# is attached to ^L keybind
function clear_and_redisplay
    clear
    commandline -f repaint
end
