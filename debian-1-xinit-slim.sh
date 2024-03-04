#!/bin/bash

clear
echo " "
echo "Instalando o gerenciador gráfico e o login"
echo " "
sudo apt install xinit -y
clear  
sudo apt install slim -y
clear                 
sudo dpkg-reconfigure slim
clear
sudo reboot
