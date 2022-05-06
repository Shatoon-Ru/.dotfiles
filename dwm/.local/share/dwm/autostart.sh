#!/bin/bash

wmname LG3D &

#tint2 -c ~/.config/tint2/tray.tint2rc &
#~/.config/frankenwm/polybar/launch.sh &
#sxhkd -c $HOME/.config/frankenwm/sxhkdrc &
#xsetroot -cursor_name left_ptr &
#nitrogen --restore &
feh --bg-scale $HOME/Pictures/Wallpapers/zvezdnye-voyny-probuzhdenie-5487.jpg &
picom -b --config ~/.config/picom.conf &
#numlockx off &
redshift-gtk -c ~/.config/redshift.conf &
#urxvtd -q -o -f &
setxkbmap -layout us,ru -option "grp:alt_shift_toggle,grp_led:scroll" &
#xsettingsd &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#gnome-keyring-daemon --start --components=pkcs11,secrets &
#dunst &
#touchpad-indicator &
#unclutter &
#parcellite &
nm-applet &
xfce4-power-manager &
#udiskie -t &

