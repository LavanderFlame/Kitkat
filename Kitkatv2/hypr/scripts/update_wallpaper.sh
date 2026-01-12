#!/bin/sh

# 1. Load Waypaper config
source <(grep '=' ~/.config/waypaper/config.ini | sed 's/ *= */=/')

# $wallpaper now contains the correct image path.

# 2. Generate the CSS file that Waybar can actually use
cat > /home/lavander/.config/rofi/type-7/style-2.rasi<<EOF
/**
 *
 * Author : Aditya Shakya (adi1090x)
 * Github : @adi1090x
 * 
 * Rofi Theme File
 * Rofi Version: 1.7.3
 **/

@import "/home/lavander/.cache/wal/colors-rofi-dark.rasi"

/*****----- Configuration -----*****/
configuration {
	modi:                       "drun,run,filebrowser,window";
    show-icons:                 true;
    display-drun:               "APPS";
    display-run:                "RUN";
    display-filebrowser:        "FILES";
    display-window:             "WINDOW";
	drun-display-format:        "{name}";
	window-format:              "{w} · {c} · {t}";
}

/*****----- Global Properties -----*****/
* {
    font:                        "JetBrains Mono Nerd Font 10";
    background-alt:              @selected-normal-background;
    active:                      #00CCF5;
    urgent:                      #8D0083;
}

/*****----- Main Window -----*****/
window {
    /* properties for window widget */
    transparency:                "real";
    location:                    center;
    anchor:                      center;
    fullscreen:                  false;
    width:                       1000px;
    x-offset:                    0px;
    y-offset:                    0px;

    /* properties for all widgets */
    enabled:                     true;
    border-radius:               15px;
    cursor:                      "default";
    background-color:            @normal-background;
}

/*****----- Main Box -----*****/
mainbox {
    enabled:                     true;
    spacing:                     0px;
    background-color:            transparent;
    orientation:                 horizontal;
    children:                    [ "imagebox", "listbox" ];
}

imagebox {
    padding:                     20px;
    background-color:            transparent;
    background-image:            url("$wallpaper", height);
    orientation:                 vertical;
    children:                    [ "inputbar", "dummy", "mode-switcher" ];
}

listbox {
    spacing:                     20px;
    padding:                     20px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ "message", "listview" ];
}

dummy {
    background-color:            transparent;
}

/*****----- Inputbar -----*****/
inputbar {
    enabled:                     true;
    spacing:                     10px;
    padding:                     15px;
    border-radius:               10px;
    background-color:            @background-alt;
    text-color:                  @active-foreground;
    children:                    [ "textbox-prompt-colon", "entry" ];
}
textbox-prompt-colon {
    enabled:                     true;
    expand:                      false;
    str:                         "";
    background-color:            inherit;
    text-color:                  inherit;
}
entry {
    enabled:                     true;
    background-color:            inherit;
    text-color:                  inherit;
    cursor:                      text;
    placeholder:                 "Search";
    placeholder-color:           inherit;
}

/*****----- Mode Switcher -----*****/
mode-switcher{
    enabled:                     true;
    spacing:                     20px;
    background-color:            transparent;
    text-color:                  @active-foreground;
}
button {
    padding:                     15px;
    border-radius:               10px;
    background-color:            @background-alt;
    text-color:                  inherit;
    cursor:                      pointer;
}
button selected {
    background-color:            @selected-active-background;
    text-color:                  @active-foreground;
}

/*****----- Listview -----*****/
listview {
    enabled:                     true;
    columns:                     1;
    lines:                       8;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    
    spacing:                     10px;
    background-color:            transparent;
    text-color:                  @active-foreground;
    cursor:                      "default";
}

/*****----- Elements -----*****/
element {
    enabled:                     true;
    spacing:                     15px;
    padding:                     8px;
    border-radius:               10px;
    background-color:            transparent;
    text-color:                  @active-foreground;
    cursor:                      pointer;
}
element normal.normal {
    background-color:            inherit;
    text-color:                  inherit;
}
element normal.urgent {
    background-color:            @urgent;
    text-color:                  @active-foreground;
}
element normal.active {
    background-color:            @active;
    text-color:                  @active-foreground;
}
element selected.normal {
    background-color:            @selected-active-background;
    text-color:                  @active-foreground;
}
element selected.urgent {
    background-color:            @urgent;
    text-color:                  @active-foreground;
}
element selected.active {
    background-color:            @urgent;
    text-color:                  @active-foreground;
}
element-icon {
    background-color:            transparent;
    text-color:                  inherit;
    size:                        32px;
    cursor:                      inherit;
}
element-text {
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}

/*****----- Message -----*****/
message {
    background-color:            transparent;
}
textbox {
    padding:                     15px;
    border-radius:               10px;
    background-color:            @background-alt;
    text-color:                  @active-foreground;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}
error-message {
    padding:                     15px;
    border-radius:               20px;
    background-color:            @normal-background;
    text-color:                  @active-foreground;
}
EOF

cat > /home/lavander/.config/hypr/hyprlock.conf<<EOF

background {
    path = $wallpaper
    blur_passes = 1
}


source = ~/.cache/wal/colors-hyprland.conf

label {
    text = cmd[update:1000] echo "$(date)"
    color = $color1 
    font_size = 25
    font_family = Noto Sans

    position = 0, 80
    halign = center
    valign = center
}

shape {
    size = 900, 60
    color = $foreground
    rounding = -1 # circle
    border_size = 4
    border_color = $foreground

    position = 0, 80
    halign = center
    valign = center
}
input-field {
    size = 20%, 5%
    outline_thickness = 3
    inner_color = rgba(255, 255, 255, 0) # no fill

    outer_color = $color2 $color4 45deg
    check_color= $color1 $color6 120deg
    fail_color= $color6 $color10 40deg

    font_color = $foreground
    fade_on_empty = false
    rounding = 15

    position = 0, -20
    halign = center
    valign = center
}
EOF

wal -i $wallpaper
pkill vesktop
sleep 0.1
pkill swayosd-server
sleep 0.1
swayosd-server & disown
pkill dunst
cp -f $HOME/.cache/wal/midnight-discord.css $HOME/.config/vesktop/themes/midnight-discord.css
dunst -config $HOME/.cache/wal/dunstrc & disown
notify-send "Finished!" "Your colors have been updated to match $wallpaper!"
pkill waybar;waybar & disown