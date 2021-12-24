#!/bin/sh

#############
### fcitx ###
#############

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx

###############
### locking ###
###############

sh "$HOME/.screenlayout/001-xps-undocked.sh"
xautolock -time 15 -locker "lock" 2>&1 &

#############
### xterm ###
#############

xrdb "$HOME/.Xresources"
xmodmap ~/.Xmodmap
xbindkeys --poll-rc

###########################
### background services ###
###########################

dunst > /dev/null &
blueman-applet > /dev/null &
dbus-launch --sh-syntax --exit-with-session > /dev/null

# for caldigit dock
$HOME/.dotfiles/bin/displayman > /tmp/displayman.log &

# for bluetooth keyboards
$HOME/.dotfiles/bin/btkbman > /tmp/btkbman.log &

exec i3
