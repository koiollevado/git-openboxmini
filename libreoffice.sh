
#!/bin/bash

echo " "
echo "Atualizando o repositório... Aguarde..."
echo " "
sudo apt update
echo " "
echo "Atualizando a distro... Aguarde..."
echo " "
sudo apt install -f
echo " "
echo "Removendo arquivos obsoletos... Aguarde..."
echo " "
clear
echo " "
echo "Instalando o libreoffice writer... Aguarde..."
echo " "
sudo apt install libreoffice-writer -y
clear
echo " "
echo "Instalando o libreoffice calc... Aguarde..."
echo " "
sudo apt install libreoffice-calc -y
clear
echo " "
echo "Instalando o libreoffice impress... Aguarde..."
echo " "
sudo apt install libreoffice-impress -y
clear
echo " "
echo "Instalando a tradução libreoffice... Aguarde..."
echo " "
sudo apt install libreoffice-l10n-pt-br -y
exit
