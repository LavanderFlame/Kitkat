#!/bin/bash

# List of themes
themes=("Bar 1" "Bar 2" "Bar 3")
#theme
theme="$HOME/.config/rofi/type-7/simple.rasi"

#options
    option_1=" Gmail - Narelynkiu"
	option_2=" Gmail - Narelynrodriguez03"
	option_3=" Gmail - Pumpkinboo666"
	option_4=" Youtube"
	option_5="󰑴 Canvas"
	option_6=" Nerd Fonts"

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Quick Links" \
		-mesg "Using 'Zen Browser' as default web browser" \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		xdg-open 'https://mail.google.com/mail/u/1/#inbox'
	elif [[ "$1" == '--opt2' ]]; then
		xdg-open 'https://mail.google.com/mail/u/2/#inbox'
	elif [[ "$1" == '--opt3' ]]; then
		xdg-open 'https://mail.google.com/mail/u/0/#inbox'
	elif [[ "$1" == '--opt4' ]]; then
		xdg-open 'https://www.youtube.com/'
	elif [[ "$1" == '--opt5' ]]; then
		xdg-open 'https://online.valenciacollege.edu/calendar#view_name=month&view_start=2026-01-11'
	elif [[ "$1" == '--opt6' ]]; then
		xdg-open 'https://www.nerdfonts.com/cheat-sheet'
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
esac