
#!/bin/bash

# configurando o papel de parede aleatorio do desktop
mv wallpapers ~/.wallpapers
mkdir ~/Imagens/wallpapers
chmod +x ~/.wallpapers
echo "/home/$USER/.wallpapers" >> ~/.config/openbox/autostart

# instala Icons suru 4all e os temas windows 8 e windows 10
cat xa* > Suru-4All.tar.gz
mkdir -p ~/.local/share/icons
tar -vzxf Suru-4All.tar.gz
mv Suru\ 4All/ ~/.local/share/icons
unzip Win8.zip
unzip Win10.zip
mkdir -p ~/.local/share/themes
mv Win8/ ~/.local/share/themes
mv Win10/ ~/.local/share/themes

# configuracoes manuais
echo "Permissão para reiniciar e desligar o computador"
echo "Edite o arquivo /etc/sudoers"
echo "E adicione ao final do arquivo a seguinte linha"
echo " "
echo "$( whoami ) ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff"
echo " "
sudo leafpad /etc/sudoers

# configurando o login automático
echo "Login automático deste usuário"
echo "Edite o arquivo /etc/slim.conf"
echo "E adicione ao final do arquivo as seguintes linhas"
echo " "
echo "default_user        $( whoami )"
echo "auto_login          yes"
echo " "
sudo leafpad /etc/slim.conf
