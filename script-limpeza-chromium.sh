
#!/bin/bash

rm /home/$USER/.cache/chromium/Default/Code\ Cache/js/*
rm /home/$USER/.cache/chromium/Default/Cache/*
rm /home/$USER/.local/share/Trash/info/*
rm /home/$USER/.local/share/Trash/files/*
cd /home/$USER/.local/share/Trash/files/
rm -rf *