
#!/bin/bash

rm /home/$USER/.cache/mozilla/firefox/217x97uu.default-release/cache2/entries/*
rm /home/$USER/.local/share/Trash/info/*
rm /home/$USER/.local/share/Trash/files/*
cd /home/$USER/.local/share/Trash/files/
rm -rf *
