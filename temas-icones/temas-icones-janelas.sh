#!/bin/bash

# instala Icons suru 4all e La Captaine e os temas windows 8 e windows 10
clear
echo " "
echo "    Temas para ícones e janelas. Digite uma das opções:"
echo "------------------------------------------------------------"
echo "                          ICONES                            "
echo "------------------------------------------------------------"
echo "                  0 - Icones Suru-4All                      "
echo "                  1 - Icones La Capitaine                   "
echo "                  2 - Icones Windows 10                     "
echo "------------------------------------------------------------"
echo "                           TEMAS                            "
echo "------------------------------------------------------------"
echo "                    3 - Tema Windows 8                      "
echo "                    4 - Tema Windows 10                     "
echo "                    5 - Temas Openbox                       "
echo "------------------------------------------------------------"
echo -n "Tecle Enter para confirmar: " ; read icons

case "$icons" in
 0|"")
 cat xa* > Suru-4All.tar.gz
 mkdir -p ~/.local/share/icons
 tar -vzxf Suru-4All.tar.gz
 mv Suru\ 4All/ ~/.local/share/icons
 clear
 ;; 
 1)
 mkdir -p ~/.local/share/icons
 unzip lacapitaine.zip -d ~/.local/share/icons
 clear
 ;;
 2)
 mkdir -p ~/.local/share/themes
 unzip Win10IconPackv0.1.zip -d ~/.local/share/icons
 clear
 ;;
 3)
 mkdir -p ~/.local/share/themes
 unzip Win8.zip -d ~/.local/share/themes
 clear
 ;;
 4)
 mkdir -p ~/.local/share/themes
 unzip Win10.zip -d ~/.local/share/themes
 clear
 ;;
 5)
 mkdir -p ~/.local/share/themes
 unzip themes.zip -d ~/.local/share/
 clear
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
