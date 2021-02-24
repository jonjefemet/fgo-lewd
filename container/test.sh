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
${WHITE}Ingrese manga a buscar:${GREEN}"

echo "Nombre:"
read -r name

content=$(wget -q -O - "https://lectortmo.com/library?_page=1&title=${name/ /+}")

wget -O test.html "https://lectortmo.com/library?_page=1&title=${name/ /+}"
#echo $content
#echo $content | grep -oP '(?<=<title>).*?(?=</title>)'
#echo $content | grep -Po 'h4 class="text-truncate"'
#echo $content | grep -oP "<h4 class=\"text-truncate\" title=\"[^>]*>"
echo $content | grep -oP "(?<=<h4 class=\"text-truncate\" title=\").*?(?=\">)"
SAD=$content | grep -oP "(?<=<h4 class=\"text-truncate\" title=\").*?(?=\">)"
#titles=$($content | grep -oP "(?<=<h4 class=\"text-truncate\" title=\").*?(?\"=>)")
echo $SAD
#title=content | grep -o title

#echo $content
#content=$(wget -q -O - https://www.pixiv.net/en/tags/${tags})
