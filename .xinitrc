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

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export PATH="$HOME/bin/wm:$PATH"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  if [ "$ID" = "void" ]; then
    XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
    export XDG_RUNTIME_DIR
  fi

  if [ -n "$XDG_RUNTIME_DIR" ] && [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 0700 "$XDG_RUNTIME_DIR"
  fi
fi

if [ "$ID" = "arch" ]; then
  exec dwm
else
  exec dbus-run-session dwm
fi
