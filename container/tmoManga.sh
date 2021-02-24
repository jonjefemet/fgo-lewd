#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

begin=$(date +"%s")

echo -e "${WHITE}Ingrese manga a buscar:${GREEN}"

echo -e "Nombre:"
read -r name

echo -e "${WHITE}\nAccediendo al sistio ...\n"

content=$(wget -q -O - "https://lectortmo.com/library?_page=1&title=${name/ /+}")

echo -e "Buscando Títulos ...\n"

echo $content | grep -oP "(?<=<h4 class=\"text-truncate\" title=\").*?(?=\">)" >names.txt

array=()
while read -r line; do
    # Reading each line
    array+=("$line")
done <names.txt

menus_titles() {

    normal=$(echo "\033[m")
    number=$(echo "\033[33m") #yellow
    bgred=$(echo "\033[41m")
    fgred=$(echo "\033[31m")

    printf "${CYAN}*********************************************\n"
    printf "${normal}           Títulos Disponibles\n"
    printf "${CYAN}*********************************************\n"
    n=1
    for name in "${array[@]}"; do
        printf "${CYAN}**${number} $n)${CYAN} $name ${normal}\n"
        n=$((n + 1))
    done
    printf "${CYAN}*********************************************${normal}\n"
    printf "Ingrese una opción del menú e ingrese o ${fgred}x para salir. ${normal}"
    read opt
}

menus_titles
while [ -n "$opt" ]; do

done
