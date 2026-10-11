# Start X after .zshrc has initialized PATH and the interactive environment.
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
