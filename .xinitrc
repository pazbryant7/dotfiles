#!/bin/env sh

userresources="$HOME/.Xresources"
sysresources="/etc/X11/xinit/.Xresources"

if [ -f /etc/os-release ]; then
  . /etc/os-release
fi

if [ -f "$sysresources" ]; then
  xrdb -merge "$sysresources"
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

# This loop natively launches the D-Bus user session on Void
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec /home/bryant/Documents/github/dwm/result/bin/dwm
exec dwm
