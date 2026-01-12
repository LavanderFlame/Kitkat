#!/bin/bash

print_logo(){
    cat << "EOF"
-----------------------------------------------------
 ____  __.__  __   __            __   
|    |/ _|__|/  |_|  | _______ _/  |_ 
|      < |  \   __\  |/ /\__  \\   __\
|    |  \|  ||  | |    <  / __ \|  |   Made by: Lavander
|____|__ \__||__| |__|_ \(____  /__|  
        \/             \/     \/      
-----------------------------------------------------
EOF
}

greeting() {
    cat << EOF
Hello there, $USER! Thank you for using this program!
Just to let you know, this may take awhile...
Also it is recommended to have a fresh install!
Do you consent to having this program install the dotfiles onto your PC?
-----------------------------------------------------

OPTIONS

1)Continue
2)Exit
EOF
}

clear 
print_logo
greeting

while true; do
    read -p "Enter a number (1 or 2): " input

    # Validate input
    if [[ "$input" =~ ^[1-2]$ ]]; then
        # Input is valid, break out of the loop
        break
    else
        echo "Invalid input, try again."
    fi
done

# Perform action based on input
if [[ "$input" == "1" ]]; then

echo "Let us continue then."
echo "First we will install pac packages"

echo "Installing waybar" && sudo pacman -S waybar --noconfirm || echo "Failed to install waybar skipping..."
echo "Installing fastfetch" && sudo pacman -S fastfetch --noconfirm || echo "Failed to install fastfetch, skipping..."
echo "Installing rofi" && sudo pacman -S rofi --noconfirm || echo "Failed to install rofi, skipping..."
echo "Installing blueman (for bluetooth)" && sudo pacman -S blueman --noconfirm || echo "Failed to install blueman (for bluetooth), skipping..."
echo "Installing bluez-utils" && sudo pacman -S bluez-utils --noconfirm || echo "Failed to install bluez-utils, skipping..."
echo "Installing wl-clipboard " && sudo pacman -S wl-clipboard --noconfirm || echo "Failed to install wl-clipboard, skipping..."
echo "Installing cliphist" && sudo pacman -S cliphist --noconfirm || echo "Failed to install cliphist, skipping..."
echo "Installing rofi-emoji" && sudo pacman -S rofi-emoji --noconfirm || echo "Failed to install rofi-emoji , skipping..."
echo "Installing xdg-desktop-portal-hyprland" && sudo pacman -S xdg-desktop-portal-hyprland --noconfirm || echo "Failed to install xdg-desktop-portal-hyprland, skipping..."
echo "Installing swww" && sudo pacman -S swww --noconfirm || echo "Failed to install swww, skipping..."
echo "Installing swayosd" && sudo pacman -S swayosd --noconfirm || echo "Failed to install swayosd, skipping..."
echo "Installing Hyprpolkit agent" && sudo pacman -S hyprpolkitagent --noconfirm || echo "Failed to install hyprpolkit, skipping..."

while true; do
echo "Are you ok with installing nerdfonts? It will install ALL of them. If you chose not to then you must install them manually yourself"
echo
echo "1.) Go for it!"
echo "2.) No thanks. . ."
echo "3.) Only fira-code"
read -p " ■ " fontCon

case "$fontCon" in 
1) 
    sudo pacman -S nerd-fonts --noconfirm
    break
    ;;

2) echo "Alright!"
    break
    ;;

3) sudo pacman -S ttf-fira-code --noconfirm 
    break
    ;;

*)
    echo "Couldn't install nerd fonts. . ."
    ;;
    esac
done

echo "Installing hyprlock" && sudo pacman -S hyprlock --noconfirm || echo "Failed to install hyprlock, skipping..."
echo "Installing Pipx" && sudo pacman -S python-pipx --noconfirm || echo "Failed to install Pipx, skipping..."
echo "Installing pywal 16 colors" && pipx install pywal16 || echo "Failed to install pywal 16 colors, skipping..."

while true; do
echo "Are you ok with installing flatpaks?"
echo
echo "1.) Go for it!"
echo "2.) No thanks/I already have it"
read -p " ■ " flatpakCon

case "$flatpakCon" in 
1) 
    sudo pacman -S flatpak --noconfirm
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    read -p "Install spotify flatpak? (y/n) " spotanswer
if [[ "$spotanswer" =~ ^[Yy]$ ]]; then
    flatpak install flathub com.spotify.Client
else
    echo "Skipping spotify flatpak..."
fi

read -p "Install steam flatpak? (y/n) " steamanswer
if [[ "$steamanswer" =~ ^[Yy]$ ]]; then
    flatpak install flathub com.valvesoftware.Steam
else
    echo "Skipping steam flatpak..."
fi

read -p "Install vesktop flatpak? (y/n) " veskanswer
if [[ "$veskanswer" =~ ^[Yy]$ ]]; then
    flatpak install dev.vencord.Vesktop
else
    echo "Skipping vesktop flatpak..."
fi

read -p "Install Vscode flatpak? (y/n) " vsanswer
if [[ "$vsanswer" =~ ^[Yy]$ ]]; then
    flatpak install com.visualstudio.code
else
    echo "Skipping Vscode flatpak..."
fi

read -p "Install OBS flatpak? (y/n) " obsanswer
if [[ "$obsanswer" =~ ^[Yy]$ ]]; then
    flatpak install com.obsproject.Studio
else
    echo "Skipping Obs flatpak..."
fi

    break
    ;;

2) echo "Alright!"
    break
    ;;

*)
    echo "Couldn't install flatpaks. . ."
    ;;
    esac
done

while true; do
echo "Would you like a browser?"
echo
echo "1.) Zen-Browser AUR"
echo "2.) Zen-Browser flatpak"
echo "3.) Librewolf AUR"
echo "4.) Librewolf Flatpak"
echo "5.) No thanks"
read -p " ■ " browserCon

case "$browserCon" in 
1) 
    sudo pacman -S zen-browser --noconfirm
    break
    ;;

2) flatpak install flathub app.zen_browser.zen
    break
    ;;

3) sudo pacman -S librewolf --noconfirm 
    break
    ;;

4) flatpak install flathub io.gitlab.librewolf-community
    break
    ;;

5) echo "Alright!"
    break
    ;;

*)
    echo "Couldn't install Browser. . ."
    ;;
    esac
done

mv -f $HOME/Downloads/Kitkatv2/dunst $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/fastfetch $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/gtk-3.0 $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/gtk-4.0 $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/hypr $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/kitty $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/rofi $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/swayosd $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/wal $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/waybar $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/waypaper $HOME/.config/ || echo "Failed to move config file"
mv -f $HOME/Downloads/Kitkatv2/wlogout $HOME/.config/ || echo "Failed to move config file"

chmod +x $HOME/.config/waybar/scripts/cava.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/waybar/scripts/check_updates.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/waybar/scripts/record-screen || echo "Failed to chmod config file"
chmod +x $HOME/.config/waybar/scripts/record-screend || echo "Failed to chmod config file"
chmod +x $HOME/.config/waybar/scripts/update_system.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/rofi/type-7/launcher.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/rofi/type-7/quickapps.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/hypr/scripts/update_wallpaper.sh || echo "Failed to chmod config file"
chmod +x $HOME/.config/hypr/scripts/waybar_switcher.sh || echo "Failed to chmod config file"

echo "Your computer is now sweet~"

else
    echo "Exiting now..."
fi



