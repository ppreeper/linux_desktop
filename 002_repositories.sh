#!/bin/bash
# pgdg.list
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# echo "deb http://apt.postgresql.org/pub/repos/apt/ zesty-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# lxd
# sudo apt install -y lxd lxd-client lxd-tools
sudo snap install lxd
sudo apt -y install criu

# libreoffice
# sudo add-apt-repository -y ppa:libreoffice/ppa

# wine
# wget --quiet -O - https://dl.winehq.org/wine-builds/Release.key | sudo apt-key add -
# echo "deb https://dl.winehq.org/wine-builds/ubuntu/ artful main" | sudo tee /etc/apt/sources.list.d/wine.list

