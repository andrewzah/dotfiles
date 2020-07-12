#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

setxkbmap -layout us -option ctrl:nocaps

fcitx
dbus-launch --sh-syntax --exit-with-session > /dev/null
exec i3
