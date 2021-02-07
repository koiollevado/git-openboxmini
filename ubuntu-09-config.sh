
#!/bin/bash

# configurando o papel de parede aleatorio do desktop
mv wallpapers ~/.wallpapers
mkdir ~/Imagens/wallpapers
chmod +x ~/.wallpapers
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart

# remove o terminal uxterm xterm
sudo apt remove xterm -y

# instala o terminal lxterminal
sudo apt install lxterminal -y

# instala Icons suru 4all e os temas windows 8 e windows 10
tar -vzxf Suru-4All.tar.gz
mv Suru\ 4All/ ~/.local/share/icons
unzip Win8.zip
unzip Win10.zip
mv Win8/ ~/.local/share/themes
mv Win10/ ~/.local/share/themes