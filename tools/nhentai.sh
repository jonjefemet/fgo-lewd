#!/bin/bash
#sin

#view
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

begin=$(date +"%s")

echo "
${WHITE}Ingrese un nombre a buscar:${GREEN}"

#get
echo "Nombre:"
read -r name
echo -e "Leyendo /${GREEN}$name ..
${WHITE}"

wget -q -nv -O ${name}.html https://nhentai.to/search?q=${name}
json="cat ${name}.html"
jamet="cat links.txt"


var="$($json | grep -oP '(?<=<title>)[^<]*' | sed -z 's/\n//g' | sed 's/&raquo;/-/')" ## title > sed fg/o > _
tag="$($json | grep -Po '(?<=<span class="name">)([^<]*)')" ## tags
count="$($json | grep -Po '(?<=<span class="name">)[0-9]([^<]*)')" ## count

tag="$($json | grep -Po '(?<=<div class="caption">)([^<]*)')" ## tags

echo ${tag} 
echo -e "${GREEN}"
