#!/bin/bash

#instalando pacotes
sudo apt install wget \
                 pcmanfm \
                 wicd \
                 widc-curses \
                 pulseaudio \
                 pavucontrol \
                 conky \
                 p7zip \
                 p7zip-full \
                 p7zip-rar \
                 lzma \
                 lzma-dev \
                 xarchiver \
                 gnome-screenshot \
                 feh \
                 vlc --no-install-recommends --no-install-suggests \
                 plank 
clear

#configurações de execução do sistema

#configurando o xinitrc
mv xinitrc ~/.xinitrc
chmod +x ~/.xinitrc

#configurando o conkyrc
mv conkyrc ~/.conkyrc

#configurando o tráfego do conexão de rede no conky
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

#arquivo de configuração .Xresources
mv Xresources ~/.Xresources

#configurando o autostart
mkdir -p /home/$USER/.config/openbox
echo "plank &" > /home/$USER/.config/openbox/autostart
echo "conky -c /home/$USER/.conkyrc &" >> ~/.config/openbox/autostart

#configurando openbox menu e atalhos de teclado
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox

#remove o terminal uxterm xterm (caso não instale o tex live)
#sudo apt purge xterm
#sudo apt purge uxterm

#configurando o editor de texto no menu openbox
sed -i "s/leafpad/geany/g" ~/.config/openbox/menu.xml

sudo reboot
