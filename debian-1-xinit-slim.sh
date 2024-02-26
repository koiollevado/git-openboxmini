#!/bin/bash

clear
echo " "
echo "Instalando o gerenciador gráfico e o login"
echo " "
sudo apt install xinit \
                 slim
clear                 
sudo dpkg-reconfigure slim
clear
sudo reboot
