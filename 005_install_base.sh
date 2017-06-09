#!/bin/bash
sudo apt -y install man-db vim-nox mc fdupes wget curl aria2 curlftpfs sshfs nfs-common cpio bzip2 lzop pigz unzip unrar swaks fio htop gddrescue tree nmon cabextract
sudo apt -y install chromium-browser firefox
sudo apt -y install python-software-properties pkg-config software-properties-common
sudo apt -y install build-essential git
wget -O ttf-mscorefonts-installer_3.6_all.deb http://ftp.ca.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo dpkg -i ttf-mscorefonts-installer_3.6_all.deb
rm ttf-mscorefonts-installer_3.6_all.deb
