#!/bin/bash

#instalando pacotes
sudo apt install wget -y
sudo apt install pcmanfm -y
sudo apt install wicd -y
sudo apt install widc-curses -y
sudo apt install pulseaudio -y
sudo apt install pavucontrol -y
sudo apt install conky -y
sudo apt install p7zip -y
sudo apt install p7zip-full -y
sudo apt install p7zip-rar -y
sudo apt install lzma -y
sudo apt install lzma-dev -y
sudo apt install xarchiver -y
sudo apt install gnome-screenshot -y
sudo apt install feh -y
sudo apt install vlc --no-install-recommends --no-install-suggests -y
sudo apt install plank -y
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
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart
echo "rm /home/$USER/.cache/google-chrome/Default/Cache/Cache_Data/*_*" >> ~/.config/openbox/autostart
echo "rm /home/$USER/.local/share/Trash/files/*" >> ~/.config/openbox/autostart
echo "rm /home/$USER/.local/share/Trash/info/*" >> ~/.config/openbox/autostart
echo "rm -R /home/$USER/.local/share/Trash/files/*" >> ~/.config/openbox/autostart
echo "rm -R /home/$USER/.local/share/Trash/info/*" >> ~/.config/openbox/autostart

#configurando openbox menu e atalhos de teclado
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox

#remove o terminal uxterm xterm (caso não instale o tex live)
#sudo apt purge xterm
#sudo apt purge uxterm

#configurando o editor de texto no menu openbox
sed -i "s/leafpad/geany/g" ~/.config/openbox/menu.xml

sudo reboot
