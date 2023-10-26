#!/bin/bash

# instala Icons suru 4all e La Captaine e os temas windows 8 e windows 10
cat xa* > Suru-4All.tar.gz
mkdir -p ~/.local/share/icons
tar -vzxf Suru-4All.tar.gz
mv Suru\ 4All/ ~/.local/share/icons

mkdir -p ~/.local/share/themes
unzip Win8.zip -d ~/.local/share/themes
unzip Win10.zip -d ~/.local/share/themes
unzip lacapitaine.zip -d ~/.local/share/icons
