
#!/bin/bash

# configurando o papel de parede aleatorio do desktop
mv wallpapers ~/.wallpapers
mkdir ~/Imagens/wallpapers
chmod +x ~/.wallpapers

# configurando o conkyrc
mv conkyrc ~/.conkyrc

# configurando o autostart
echo "conky -c ~/.conkyrc &" >> ~/.config/openbox/autostart
echo "~/.wallpapers" >> ~/.config/openbox/autostart