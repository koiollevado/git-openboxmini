
#!/bin/bash

if [ -e /usr/local/bin/youtube-dl ]; then sudo rm /usr/local/bin/youtube-dl; fi

sudo apt install wget -y
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
