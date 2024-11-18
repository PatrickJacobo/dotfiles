setxkbmap -option compose:rctrl &
setxkbmap -option ctrl:nocaps &
xinput set-prop 9 317 1 &
picom --config ~/.config/picom/picom.conf &
xfce4-power-manager &
pipewire &
pipewire-pulse &
wireplumber & 
clipmenud &
nitrogen --restore  &
dwmblocks &
exec dwm
