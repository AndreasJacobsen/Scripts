#!/usr/bin/env bash

#TODO: Installasjon for Latte-dock, shutter, vscode, atom.
#TODO: unattended-upgrades <- sikkerhetspakker.
#INFO: Script portet from focusing on KDE to Mint/Gnome/GTK. 

echo -e "\e[95m Install script av Andreas for Ubuntu-basserte distribusjoner, skrevet for Kristian"
echo -e "\e[32m Oppdaterer pakker og pakkeliste \e[33m" 
sleep 2
sudo apt-get -y update; sudo apt-get -y upgrade

sleep 2
echo -e "\e[32m Installerer pakker fra pakkelister: \e[95m unrar \e[96m curl \e[95m zsh \e[96m git-core" 
echo -e "\e[39m"
sleep 2
sudo apt-get -y install rar curl zsh git-core



sleep 4 
echo -e "\e[32m Installerer Oh My zsh \e[39m"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s 'which zsh'
chsh -s 'which zsh'
sleep 3
echo -e "\e[32m Oh My zsh installert, restart maskinen før det tar effekt\n\n \e[39m"
echo -e "\e[32m installerer oh my zsh spaceship tema \e[39m"
sleep 6
wget git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "Set ZSH_THEME="spaceship" in your ~.zshrc to activate"


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
    sudo apt-get -y update && sudo apt-get install -y neofetch


    echo -e "Konfigurer zsh til å autostarte Neofetch ved terminalstart  \e[39m"
    echo 'neofetch' >> ~/.zshrc 
    echo -e "fjern neofetch fra ~/.zshrc for å deaktivere  \e[39m"

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
    sudo apt-get -y update && sudo apt-get -y install qbittorrent


    echo -e "\e[32m Qbittorrent nå installert på din maskin \e[33m"
    

else 
    echo -e "\e[95m Qbittorent-installsjon ble funnet på din maskin\n\n"
    fi    
    
echo -e "\e[95m Install script av Andreas for Ubuntu-basserte distribusjoner, skrevet for Kristian"

echo -e "\e[32m Installerer Spotify "
echo -e "\e[39m"
sleep 4
echo -e "\e[32m Sjekker om Google Chrome er installert på maskinen din:\e[39m"


echo -e "\e[32m installerer snapd"
sudo apt-get -y update
sudo add-aptsudo apt-get update
sudo apt-get install snapcraft-repository ppa:snappy-dev/tools


snap install spotify
echo -e "\e[32m Installerte Spotify som snapd pakke, restart maskinen din for å se programmet"

snap install spotify
echo -e "\e[32m Installing vscode as a snapd package"
sudo snap install --classic vscode

sleep 3 
snap install spotify
echo -e "\e[32m Installing Atom.io as a snapd package"
sudo snap install --classic atom

sleep 4
echo -e "\e[32m Sjekker om Google Chrome er installert på maskinen din:\e[39m"

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
    sudo apt-get -y install -f


    echo -e " Sletter Chrome installasjonsfil  \e[39m \n\n"
    rm google*

else 
    echo -e "\e[95m Chrome ble funnet på din maskin\n\n"
 fi

sleep 2
echo -e "\e[32m Installerer PyCharm, IntelliJ via snapd, restart maskinen din for å se disse  \e[39m" 
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic --edge


 
sleep 2
echo -e "\e[32m fjerner unødvendige pakker"
echo -e "\e[39m"
sudo apt-get -y autoremove

echo -e "\e[95m legger til noen av Andreas sine aliaser til ~/.zshrc"
echo -e "\e[32m Legger til alias: \e[95m gitlog \e[96m gitdiff \e[95m gitpull \e[96m dockerrm" 
echo "sjekker om de eksisterer i aliasliste først"
sleep 5

echo -e "\e[32m Installerer Python Pip og Pip3 \e[39m" 
sudo apt-get install -y python-pip python3-pip
echo -e "\e[32m Installerer virtuelvn \e[39m" 
pip3 install virtualenv 
echo -e "\e[32m Virtualenv installert, bruk med kommandoen virtualenv venvnavn \e[39m" 


#aliaseses 
#this needs to be effectivized! use functions instead
zshtest=$(grep ^ ~/.zshrc  | grep gitlog)
if [ "" == "$zshtest" ]; then
   echo -e "\e[32m  gitlog ikke funnet \n legger til gitalias" 
   echo "alias gitlog=\"git log --decorate --oneline --graph --pretty --all\"" >> ~/.zshrc 
else 
    echo -e "\e[95m gitlog alias ble funnet \n\n"
fi    

zshtest=$(grep ^ ~/.zshrc  | grep gitdiff)
if [ "" == "$zshtest" ]; then
   echo -e "\e[32m  gitdiff ikke funnet \n legger til gitalias" 
   echo "alias gitdiff=\"git --no-pager diff\"" >> ~/.zshrc 
else 
    echo -e "\e[95m gitdiff alias ble funnet \n\n"
fi    

zshtest=$(grep ^ ~/.zshrc  | grep gitpull)
if [ "" == "$zshtest" ]; then
   echo -e "\e[32m  gitdiff ikke funnet \n legger til gitalias" 
   echo "alias gitpull=\"git pull --rebase\"" >> ~/.zshrc
else 
   echo -e "\e[95m gitlog alias ble funnet \n\n"

 fi

zshtest=$(grep ^ ~/.zshrc  | grep gitdiff)
if [ "" == "$zshtest" ]; then
   echo -e "\e[32m  gitdiff ikke funnet \n legger til gitalias" 
   echo "alias gitdiff=\"git --no-pager -diff\"" >> ~/.zshrc
else
    echo -e "\e[95m gitdiff alias ble funnet \n\n"
fi

zshtest=$(grep ^ ~/.zshrc  | grep dockerrm)
if [ "" == "$zshtest" ]; then
   echo -e "\e[32m  dockerrm ikke funnet \n legger til gitalias"
   echo "alias dockerrm=\"docker rm $(docker ps -a -q -f status=exited) \"" >> ~/.zshrc
else
    echo -e "\e[95m dockerrm alias ble funnet \n\n"
fi




