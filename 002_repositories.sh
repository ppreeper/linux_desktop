#!/bin/bash
sudo cp update /usr/local/bin/update
sudo chmod +x /usr/local/bin/update

# pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# lxd
sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

# libreoffice
sudo add-apt-repository -y ppa:libreoffice/ppa

/usr/local/bin/update
