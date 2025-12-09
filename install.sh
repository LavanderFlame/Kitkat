#!/bin/bash

# Print the logo
print_logo() {
    cat << "EOF"
 ____  __.__  __   __            __   
|    |/ _|__|/  |_|  | _______ _/  |_ 
|      < |  \   __\  |/ /\__  \\   __\
|    |  \|  ||  | |    <  / __ \|  |   Made by: Lavander
|____|__ \__||__| |__|_ \(____  /__|  
        \/             \/     \/      

EOF
}

# safe exec function
run_or_skip() {
    echo "==> $1"
    shift
    "$@" || echo "⚠️  Failed: $1 — skipping..."
}

# Clear screen and show logo
clear
print_logo

# Update system
run_or_skip "Updating system" sudo pacman -Syu --noconfirm

# Install yay if missing
if ! command -v yay &> /dev/null; then
  echo "Installing yay AUR helper..."
  run_or_skip "Installing deps for yay" sudo pacman -S --needed git base-devel --noconfirm
  
  rm -rf yay
  git clone https://aur.archlinux.org/yay.git || echo "⚠️ Failed to clone yay"

  cd yay || true
  run_or_skip "Building yay" makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed"
fi

#run_or_skip "Installing Quickshell" yay -S quickshell --noconfirm
run_or_skip "Installing Waybar" pacman -S waybar --noconfirm
run_or_skip "Installing Pywal" sudo pacman -S python-pywal --noconfirm
run_or_skip "Installing fastfetch" sudo pacman -S fastfetch --noconfirm
run_or_skip "Installing themix" sudo pacman -S themix-full-git --noconfirm
run_or_skip "Installing Dolphin" sudo pacman -S dolphin --noconfirm
run_or_skip "Installing Rofi" sudo pacman -S rofi --noconfirm
run_or_skip "Installing VirtualBox" sudo pacman -S virtualbox --noconfirm
run_or_skip "Installing NWG Look" sudo pacman -S nwg-look --noconfirm
run_or_skip "Installing Blueman" sudo pacman -S blueman --noconfirm
run_or_skip "Installing Blueman-utils" sudo pacman -S bluez-utils --noconfirm
run_or_skip "Installing Wl-clipboard " sudo pacman -S wl-clipboard --noconfirm
run_or_skip "Installing Cliphist" sudo pacman -S cliphist --noconfirm
run_or_skip "Installing Rofi-emoji" sudo pacman -S rofi-emoji --noconfirm
run_or_skip "Installing Hyprlock" sudo pacman -S hyprlock

# -------------------------------
# FLATPAK + FLATHUB
# -------------------------------

run_or_skip "Installing Flatpak" sudo pacman -S flatpak --noconfirm
run_or_skip "Adding Flathub" flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "==> Installing Flatpaks..."
flatpak install -y flathub \
    app.zen_browser.zen \
    com.github.tchx84.Flatseal \
    io.github.peazip.PeaZip \
    dev.vencord.Vesktop \
    com.visualstudio.code \
    com.spotify.Client \
    org.kde.krita \
    org.azahar_emu.Azahar \
    org.kde.gwenview \
    org.gnome.clocks \
    com.obsproject.Studio\
    com.valvesoftware.Steam || echo "⚠️ Some flatpaks failed — continuing."

echo "==> Copying configs ..."
cp -rf "Kitkat/hyprland.conf" ~/.config/hypr
cp -rf "~/Kitkat/hyprlock.conf" ~/.config/hypr


echo "==> Install complete. Your system is now extra spicy. 🌶️"
