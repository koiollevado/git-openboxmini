#!/bin/bash

# instala Icons suru 4all e La Captaine e os temas windows 8 e windows 10
clear
echo " "
echo "Opções visuais para o desktop:"
echo -n "Digite (0)Icones Suru-4All (1)Icones La Capitaine (2)Tema Windows 8 (3)Tema Windows 10 (4)Temas Diversos. Tecle Enter para confirmar: " ; read icons

case "$icons" in
 0|"")
 cat xa* > Suru-4All.tar.gz
 mkdir -p ~/.local/share/icons
 tar -vzxf Suru-4All.tar.gz
 mv Suru\ 4All/ ~/.local/share/icons
 ;; 
 1)
 mkdir -p ~/.local/share/icons
 unzip lacapitaine.zip -d ~/.local/share/icons
 ;;
 2)
 mkdir -p ~/.local/share/themes
 unzip Win8.zip -d ~/.local/share/themes
 ;;
 3)
 mkdir -p ~/.local/share/themes
 unzip Win10.zip -d ~/.local/share/themes
 ;;
 4)
 mkdir -p ~/.local/share/themes
 unzip themes.zip -d ~/.local/share/
 ;;
 n|N)
 echo "O procedimento de instalação foi concluído."
 sleep 5
 clear
 ;;
 *)
 echo "Opção inválida"
 ;;
esac
