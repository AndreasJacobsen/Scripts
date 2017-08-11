#! /bin/bash


sleep 2
echo -e "\e[32m Laster ned Atom.io \e[39m"
wget -q https://github.com/atom/atom/releases/latest -O /tmp/latest
wget --progress=bar -q 'https://github.com'$(cat /tmp/latest | grep -o -E 'href="([^"#]+)atom-amd64.deb"' | cut -d'"' -f2 | sort | uniq) -O /tmp/atom-amd64.deb -q --show-progress

echo -e "\e[32m Installerer Atom.io \e[39m"
sudo dpkg -i /tmp/atom-amd64.deb

echo -e "\e[32m Atom installert \e[39m"

sleep 2
