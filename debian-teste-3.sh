#!/bin/bash

# instalando pacotes

clear
sudo apt install pcmanfm -y
clear
sudo apt install wicd -y
clear
sudo apt install wicd-curses -y
clear
sudo apt install pulseaudio -y
clear
sudo apt install pavucontrol -y
clear
sudo apt install conky -y
clear
sudo apt install p7zip -y
clear
sudo apt install p7zip-full -y
clear
sudo apt install p7zip-rar -y
clear
sudo apt install lzma -y
clear
sudo apt install lzma-dev -y
clear
sudo apt install xarchiver -y
clear
sudo apt install gnome-screenshot -y
clear
sudo apt install feh -y
clear
sudo apt install vlc --no-install-recommends --no-install-suggests -y
clear
sudo apt install plank -y
clear

# configuracoes de execucao do sistema

# configurando o xinitrc
mv xinitrc ~/.xinitrc
chmod +x ~/.xinitrc

# configurando o conkyrc
mv conkyrc ~/.conkyrc

# configurando o tráfego da conexão de rede no conky
ip addr show | grep BROADCAST | awk 'BEGIN { FS=":"; OFS=":"; } {print $2}' | sed "s/\ //g" > partner.sh

sed -i 's/^/sed -i "s\/wlp1s10\//g' partner.sh
sed -i 's/$/\/g"\ \~\/.conkyrc/' partner.sh
sed -i "1s/^/#\!\/bin\/bash\n/" partner.sh
chmod +x partner.sh
 ./partner.sh
# rm partner.sh

# arquivo de configuracao .Xresources
mv Xresources ~/.Xresources

# configurando o autostart
mkdir -p /home/$USER/.config/openbox
echo "plank &" > /home/$USER/.config/openbox/autostart
echo "conky -c /home/$USER/.conkyrc &" >> ~/.config/openbox/autostart

# configurando openbox menu e atalhos de teclado
mv menu.xml ~/.config/openbox/
mv rc.xml ~/.config/openbox/

# remove o terminal uxterm xterm
sudo apt remove xterm -y

# configurando o editor de texto no menu do openbox
sed -i "s/leafpad/geany/g" ~/.config/openbox/menu.xml

sudo reboot 
