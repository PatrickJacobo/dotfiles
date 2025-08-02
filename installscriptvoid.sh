#!/usr/bin/env sh

# this script installs a lot of stuff
# This is kind of a pain to get through
# And it ain't gonna work on muslc it is glibc cause haskell stuff
# GHCUP should be preinstalled

sudo xbps-install wget
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip |unzip >~/.fonts
sudo xbps-install libXft-devel libX11-devel harfbuzz-devel libXext-devel libXrender-devel libXinerama-devel gd-devel
sudo xbps-install xorg-fonts xorg-
mkdir -p ~/.config/
git clone "https://github.com/PatrickJacobo/xmonad" --recurse-submodules --remote-submodules ~/.config/xmonad
git clone "https://github.com/PatrickJacobo/xmobar"  ~/.config/xmobar
git clone "https://github.com/PatrickJacobo/st" ~/st

cd ~/st||exit
sudo make install clean
cd ~/.config/xmonad ||exit
stack build && stack install
cd ~/.config/xmobar ||exit
stack build && stack install

echo "All repositories processed."
sudo xbps-install rofi firefox wireplumber feh emacs-gtk3
