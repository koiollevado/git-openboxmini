#!/bin/bash

obamenu | grep '<item label="' | \
# sed -n 's/.*<item label="\([^"]*\)".*/\1/p' | \
sed -n 's/.*<item label="\([^"]*\)".*/\1/p' | \
# sort -u > apps.txt
sort > apps.txt
exit

ARQUIVO_ASSOCIACOES="novaslinhas.txt"
ARQUIVO_XML="menu.xml"
ARQUIVO_TEMP="menu_temp.xml"

cp "$ARQUIVO_XML" "$ARQUIVO_TEMP"

while IFS='|' read -r termo nova_linha; do
    sed -i "s|.*<item label=\"$termo\".*|$nova_linha|" "$ARQUIVO_TEMP"
done < "$ARQUIVO_ASSOCIACOES"

mv "$ARQUIVO_TEMP" "$ARQUIVO_XML"


