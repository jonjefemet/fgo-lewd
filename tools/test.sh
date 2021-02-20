#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

begin=$(date +"%s")
#wget -q -nv -O ${kode}.html https://www.pixiv.net/en/artworks/79095841;

#content=$(wget https://www.pixiv.net/en/artworks/79095841 -q -O -)
#echo $content

echo "
${WHITE}Ingrese tags a buscar:${GREEN}"

echo "Tags:"
read -r tags

content=$(wget -q -O - https://www.pixiv.net/en/tags/${tags})

wget https://www.pixiv.net/en/artworks/79095841

echo $content | grep -oP '(?<=<title">).*?(?=</title>)'
#title=content | grep -o title

#echo $content
