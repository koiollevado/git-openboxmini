# git-openboxmini

### Scripts para a pós instalação mínima do Openbox.
Opções de sistemas para a base mínima: 

**1. debian netinst unofficial non-free** - https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/archive/

**1.1. Imagem do CD netinst** - https://www.debian.org/CD/netinst/

Observação: Apartir da versão 12 do debian os firmwares já são inclusos na iso.

**2. ubuntu-minimal** - http://cdimages.ubuntu.com/netboot/

Recomenda-se utilizá-lo após instalação do debian netinst ou do ubuntu-minimal para agilizar a configuração do Openbox.
Recomenda-se também, saber a configuração do computador e os periféricos a ser instalados.

# Utilizando os scripts

Após a instalação do sistema base com o debian netinst ou ubuntu-minimal, abra o terminal e proceda:

**sudo apt install git**

**git clone https://github.com/koiollevado/git-openboxmini**

Logo após baixá-los, você pode remover os scripts que não vai utilizar e dar permissão de execução aos que utilizará.

**chmod +x ubuntu-\*.sh** ou **chmod +x debian-\*.sh**
 
Daí, basta seguir a ordem dos scripts para a instalação e configuração.
