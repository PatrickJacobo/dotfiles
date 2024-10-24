setxkbmap -option compose:rctrl
setxkbmap -option ctrl:nocaps
picom --config ~/.config/picom/picom.conf &
clipmenud &
nitrogen --restore  &
dwmblocks &
exec dwm
