#!/bin/env sh

userresources="$HOME/.Xresources"
sysresources="/etc/X11/xinit/.Xresources"

if [ -f "$sysresources" ]; then
  xrdb -merge "$sysresources"
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

# DWM has no desktop-session manager to provide these integration variables.
export XDG_CURRENT_DESKTOP=dwm
export DESKTOP_SESSION=dwm
export XDG_SESSION_TYPE=x11
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# Run distro-provided X session hooks when available.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec dbus-run-session -- dwm
