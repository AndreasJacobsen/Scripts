#!/bin/bash
echo "Install script av Andreas for Ubuntu-basserte distribusjoner, skrevet for Kristian"
echo -e "Oppdaterer pakker og pakkeliste\e[33m" 

sleep 2
echo -e "\e[32m Installerer pakker fra pakkelister: \e[95m unrar" 
echo -e "\e[39m"
sleep 2
sudo apt -y install rar unrar
echo -e "\e[32m Installerer Spotify "
echo -e "\e[39m"

sleep 2
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y update
sudo apt -y install spotify-client

sleep 2
echo -e "\e[32m fjerner unødvendige pakker"
echo -e "\e[39m"
sudo apt -y autoremove



