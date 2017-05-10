#!/bin/bash
echo -e "\e[95m Install script av Andreas for Ubuntu-basserte distribusjoner, skrevet for Kristian"
echo -e "\e[32m Oppdaterer pakker og pakkeliste \e[33m" 
sleep 2
sudo apt -y update; sudo apt -y upgrade

sleep 2
echo -e "\e[32m Installerer pakker fra pakkelister: \e[95m unrar \e[96m curl \e[95m zsh \e[96m git-core" 
echo -e "\e[39m"
sleep 2
sudo apt -y install rar curl zsh



sleep 4 
echo -e "\e[32m Installerer Oh My zsh \e[39m"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
sleep 3
echo -e "\e[32m Oh My zsh installert, restart maskinen før det tar effekt\n\n \e[39m"
echo -e "\e[32m installerer oh my zsh spaceship tema \e[39m"
sleep 6
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh



sleep 4 
echo -e "\e[95m Sjekker om Neofetch er installert"
install=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep dawidd0811)
if [ "" == "$install" ]; then
    echo -e "\e[32m Neofetch ikke funnet på din maskin:" 
    sleep 2
    echo -e "\e[32m Legger til Neofetch repo \e[39m" 
    sudo add-apt-repository ppa:dawidd0811/neofetch -y
    sleep 2
    echo -e "\e[32m Oppdaterer pakkeliste og installerer Neofetch \e[39m" 
    sudo apt update && sudo apt install neofetch


    echo -e "Konfigurer zsh til å autostarte Neofetch ved terminalstart  \e[39m"
    echo 'neofetch' >> ~/.zshrc 

else 
    echo -e "\e[95m Neofetch-installsjon ble funnet på din maskin\n\n"
    fi

    
sleep 4 
echo -e "\e[32m Sjekker om Qbittorent er installert på maskinen din:\e[39m"
install=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep qbittorrent)
if [ "" == "$install" ]; then
    echo -e "\e[32m Qbittorent ikke funnet på din maskin:" 
    sleep 2
    echo -e "\e[32m Legger til Qbittorent repo \e[39m" 
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
    sleep 2
    echo -e "\e[32m Oppdaterer pakkeliste og installerer Qbittorent \e[39m" 
    sudo apt update && sudo apt install qbittorrent


    echo -e "\e[32m Qbittorrent nå installert på din maskin \e[33m"
    

else 
    echo -e "\e[95m Qbittorent-installsjon ble funnet på din maskin\n\n"
    fi    
    

echo -e "\e[32m Installerer Spotify "
echo -e "\e[39m"
sleep 4
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y update
sudo apt -y install spotify-client

sleep 4
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
echo -e "\e[32m Installerer JetBrains Toolbox 1.2.2314:  \e[39m" 
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.2.2314.tar.gz
tar xvzf jetbrains-toolbox-1.2.2314.tar.gz 
cd jetbrains-toolbox-1.2.2314/
nohup ./jetbrains-toolbox &
cd ..
sudo rm -r jetbrains*
echo -e "\e[32m Jetbrains Toolbox installert, du skal se programmet nå :" 
sleep 6


 
sleep 2
echo -e "\e[32m fjerner unødvendige pakker"
echo -e "\e[39m"
sudo apt -y autoremove



