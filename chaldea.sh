#!/bin/bash

#Se declaran los tipos de colores a usar
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
begin=$(date +"%s")
chmod -R 777 ./

#Se genera la estructura del menu
show_menu() {
    normal=$(echo "\033[m")
    number=$(echo "\033[33m") #yellow
    bgred=$(echo "\033[41m")
    fgred=$(echo "\033[31m")

    echo -e "${RED}    ________________ 
   / ____/ ____/ __ \ 
  / /_  / / __/ / / /
 / __/ / /_/ / /_/ /  by jonjefemet
/_/    \____/\____/               "
    echo -e "${WHITE}        __               __ __               __     __ 
    .--|  |.-----.--.--.|__|__|.-----.-----.|  |--.|__|
    |  _  ||  _  |  |  ||  |  ||     |__ --||     ||  |
    |_____||_____|_____||  |__||__|__|_____||__|__||__|
                       |___|                           "
    printf "${CYAN}*********************************************${normal}\n"
    printf "${CYAN}**${number} 1)${CYAN} tmoManga ${normal}\n"
    printf "${CYAN}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked() {
    msgcolor=$(echo "\033[01;31m") # bold red
    normal=$(echo "\033[00;00m")   # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu

#Se valida que solo valores diferentes a vacios puedan ser introducidos
while [ -n "$opt" ]; do
    case $opt in
    1)
        source ./tools/test.sh
        show_menu
        ;;
    x)
        exit
        ;;
    \n)
        exit
        ;;
    *)
        clear
        option_picked "Pick an option from the menu"
        show_menu
        ;;
    esac
done
