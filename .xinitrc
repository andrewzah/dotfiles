#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

sh "$HOME/.dotfiles/scripts/screen-layout.sh"
xautolock -time 15 -locker "lock" &

setxkbmap -option caps:ctrl_modifier

fcitx
dunst > /dev/null &
dbus-launch --sh-syntax --exit-with-session > /dev/null
exec i3
