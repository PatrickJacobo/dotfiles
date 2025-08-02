#! /usr/bin/env sh
setxkbmap -option compose:rctrl &
kanata &
xinput set-prop 9 317 1 &
picom --config ~/.config/picom/picom.conf &
xfce4-power-manager &
pipewire &
pipewire-pulse &
wireplumber &
clipmenud &
# feh --bg-fill ~/assets/evawallpaper.png
# nitrogen --restore  &
# dwmblocks &
exec dbus-launch xmonad
# exec dwm
# exec dbus-launch --exit-with-session emacs -mm --debug-init
# emacs -mm --debug-init
