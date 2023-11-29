#!/bin/bash

sudo apt install ttf-mscorefonts-installer -y

sudo cp ./*.*tf /usr/share/fonts

sudo fc-cache -f -v
