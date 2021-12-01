#!/bin/bash

echo " "
echo "Insira uma senha para o root"
sudo passwd root
clear
sudo apt update
sudo apt upgrade
sudo apt -f install

exit
