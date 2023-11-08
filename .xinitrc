userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# keyboard
xmodmap ~/.Xmodmap &

# fix cursor
xsetroot -cursor_name left_ptr &

# start window manager
dunst &
# lxsession &
picom --config /home/bryant/.config/picom/picom.conf &
# udiskie &
unclutter &
exec bspwm
