#!/usr/bin/env sh

# this script installs a lot of stuff
# This is kind of a pain to get through
# And it ain't gonna work on muslc it is glibc cause haskell stuff
# GHCUP should be preinstalled

# programs
# pango libXext  libXrandr libXPM pango-devel pangomm2 xorg-minimal ncurses-libtinfo-libs ncurses-libtinfo-devel \
    # libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXScrnSaver-dev\
    # pkg-config git emacs-gtk3 pipewire mesa-dri mesa mesa-vulkan-intel intel-linux-firmware uv\
    # feh tlp elogind xinit cargo xinput picom clipmenud tlp setxkbmap elogind\
    # xfce4-power-manager kdeconnect thunar thunderbird PrismLauncher meld\
    # zathura xournalpp virtualbox-ose virtualbox-ose-dkms rofi yazi qbittorrent\
    # alsa-pipewire pipewire-devel wireplumber pavucontrol\
    # texlive-full zathura-pdf-poppler uv zoxide ripgrep fd eza zsh tealdeer nvim rust\
    # mdocml fzf libxml2 gawk arduino-cli composer enchant2 enchant2-devel hunspell libreoffice go qalculate\
    # winegui lua5.1 opam wget fastfetch onefetch\
    # libXft-devel libX11-devel harfbuzz-devel libXext-devel libXrender-devel libXinerama-devel gd-devel\
    # intel-ucode chrony seatd vulkan-loader noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji\
    # xdg-desktop-portal xbacklight openjdk17 openjdk17-jre flatpak gcc gpp clang gzip\
    # tar lok duf dust patch node plocate which unzip bat file curl
sudo xbps-install wget
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip |unzip >~/.fonts
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
