#!/bin/bash
echo "Install script av Andreas for Ubuntu-basserte distribusjoner, skrevet for Kristian"
echo -e "Oppdaterer pakker og pakkeliste\e[33m" 

sleep 2
echo -e "\e[32m Installerer pakker fra pakkelister: \e[95m unrar \e[96m curl" 
echo -e "\e[39m"
sleep 2
sudo apt -y install rar unrar
sudo apt -y install rar curl

echo -e "\e[32m Installerer Spotify "
echo -e "\e[39m"

sleep 2
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y update
sudo apt -y install spotify-client

echo -e "\e[32m Sjekker om GitKraken er installert på maskinen din:\e[39m"
install=$(dpkg -s gitkraken|grep installed)
if [ "" == "$install" ]; then
    echo -e "\e[32m GitKraken ikke funnet på din maskin:" 
    sleep 2
    echo -e "\e[32m Laster ned GitKraken \e[39m" 
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    sleep 2
    echo -e "\e[32m Installerer GitKraken \e[39m" 
    sudo dpkg -i gitkraken*


    echo -e "Sletter GitKraken installasjonsfil  \e[39m"
    rm gitkraken*

else 
    echo -e "\e[95m GitKraken-installsjon ble funnet på din maskin\n\n"
    fi
echo -e "\e[32m Sjekker om Google Chrome er installert på maskinen din:\e[39m"
install=$(apt-cache policy | grep "chrome")
if [ "" == "$install" ]; then
    echo -e "\e[32m Chrome ikke funnet på din maskin:" 
    sleep 2
    echo -e "\e[32m Laster ned Chrome \e[39m" 
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sleep 2
    echo -e "\e[32m Installerer Chrome \e[39m" 
    sudo dpkg -i google-chrome*


    echo -e " Sletter Chrome installasjonsfil  \e[39m \n\n"
    rm chrome*

else 
    echo -e "\e[95m Chrome ble funnet på din maskin\n\n"
    fi

sleep 2
echo -e "\e[32m fjerner unødvendige pakker"
echo -e "\e[39m"
sudo apt -y autoremove



