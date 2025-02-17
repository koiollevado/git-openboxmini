#!/bin/bash

clear
echo "🔹 Atualizando a lista de pacotes e atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instalando pacotes essenciais sem recomendações desnecessárias
echo "🔹 Instalando pacotes essenciais..."
sudo apt install --no-install-recommends xorg xinit slim openbox obmenu obconf lxappearance lxterminal geany wget pcmanfm wicd pulseaudio pavucontrol conky p7zip p7zip-full p7zip-rar lzma lzma-dev xarchiver gnome-screenshot feh vlc plank -y

clear
echo "🔹 Configurando o SLiM para login automático..."
# Configurando o login automático no SLiM
echo "default_user        $(whoami)" | sudo tee -a /etc/slim.conf > /dev/null
echo "auto_login          yes" | sudo tee -a /etc/slim.conf > /dev/null

# Gerenciador de pacotes e outras configurações
clear
echo "🔹 Configurando o arquivo .Xresources"
mv Xresources ~/.Xresources

# Configurando o Openbox e o autostart
clear
echo "🔹 Configurando o Openbox e o autostart..."
mkdir -p ~/.config/openbox
echo "plank &" > ~/.config/openbox/autostart
echo "conky -c ~/.conkyrc &" >> ~/.config/openbox/autostart

clear
echo "🔹 Configurando menu e atalhos do Openbox..."
# Substituindo o editor no menu do Openbox
sed -i "s/leafpad/geany/g" ~/.config/openbox/menu.xml

# Instalando wallpapers
echo "🔹 Instalando e configurando wallpapers..."
mv wallpapers ~/.wallpapers
mkdir -p ~/Imagens/wallpapers
chmod +x ~/.wallpapers
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart
mv wall0*.* ~/Imagens/wallpapers/

# Configuração do Conky e outros scripts
clear
echo "🔹 Configurando o Conky..."
mv conkyrc ~/.conkyrc
echo "linha1" > partner.sh 
ip addr show | grep BROADCAST | awk 'BEGIN { FS=":"; OFS=":"; } {print $2}' >> partner.sh
sed -i 's/^ /sed -i "s\/wlp1s10\//g' partner.sh
sed -i 's/$/\/g"\ \~\/.conkyrc/' partner.sh
sed -i '1s|^.*$|#!/bin/bash|' partner.sh
usuario=$USER
echo $usuario >> partner.sh
sed -i '3s|^|sed -i "s\/golimaru/|' partner.sh
sed -i '3s|$|/\g"\ \~\/.conkyrc/|' partner.sh
chmod +x partner.sh
./partner.sh
#rm partner.sh

# Configuração para reiniciar/desligar sem senha
clear
echo "🔹 Permitindo reiniciar e desligar o sistema sem senha..."
echo "$(whoami) ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff" | sudo tee -a /etc/sudoers > /dev/null
sudo geany /etc/sudoers

# Configurando o login automático
clear
echo "🔹 Configurando o login automático de usuário..."
read -p "Deseja configurar o login automático de usuário? (C)onfigurar / (S)air: " resposta
if [[ "$resposta" == "C" || "$resposta" == "c" ]]; then
    echo "Adicionando login automático no SLiM..."
    echo "default_user        $(whoami)" | sudo tee -a /etc/slim.conf > /dev/null
    echo "auto_login          yes" | sudo tee -a /etc/slim.conf > /dev/null
else
    echo "Saindo da configuração..."
fi

# Reconhecimento de unidades de CDROM - DVDROM (opcional)
clear
read -p "Deseja configurar o reconhecimento de unidades de CDROM/DVDROM? (I)niciar AutoFS / (S)air: " resposta
if [[ "$resposta" == "I" || "$resposta" == "i" ]]; then
    echo "Instalando AutoFS..."
    sudo apt install autofs -y
    sudo apt -f install
else
    echo "Saindo da configuração..."
fi

clear
echo "🔹 Finalizando a instalação, reiniciando..."
sudo reboot
