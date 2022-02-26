
#!/bin/bash

echo "Insira uma url do YouTube: " ; read url

file=./video-do-YouTube.m3u8

if test -f "$file"; then
    rm $file
fi

touch $file

echo "#EXTM3U">>video-do-YouTube.m3u8
echo " ">>video-do-YouTube.m3u8
echo "#EXTINF:-1 , Video-YouTube">>video-do-YouTube.m3u8
youtube-dl -g -f best $url | grep http >>video-do-YouTube.m3u8

vlc $file
