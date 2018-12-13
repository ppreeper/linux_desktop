#!/bin/bash

function spause {
    read -n1 -r -p "Press any key to continue..." key
}

function update {
    sudo bash -c "apt update; apt -y dist-upgrade; apt -y autoremove; apt -y autoclean"
}

echo -e "\n# Adjust NSSwitch"

spause

sudo sed -e 's/^hosts:.*$/hosts:\t\tfiles dns mdns4_minimal myhostname [NOTFOUND=return]/' -i /etc/nsswitch.conf
sudo sed -e 's/enabled=*$/enabled=0/' -i /etc/default/apport

echo -e "\n# Make common dirs"

spause

sudo chmod 777 /mnt
mkdir ${HOME}/apps
mkdir ${HOME}/.cfg

cat << _EOF_ >> ${HOME}/.bashrc
for f in \${HOME}/.cfg/*cfg
do
    source \${f}
done
_EOF_


echo -e "\n# Install base"

spause

sudo apt -y install vim-nox ;
sudo apt -y install mc ;
sudo apt -y install fdupes ;
sudo apt -y install lzop ;
sudo apt -y install pigz ;
sudo apt -y install unrar ;
sudo apt -y install fio ;
sudo apt -y install cabextract ;
sudo apt -y install tree ;
sudo apt -y install gddrescue ;
sudo apt -y install gdebi-core ;
sudo apt -y install aria2 ;
sudo apt -y install curlftpfs ;
sudo apt -y install sshfs ;
sudo apt -y install nfs-common ;
sudo apt -y install samba ;
sudo apt -y install krb5-user ;
sudo apt -y install cifs-utils ;
sudo apt -y install swaks ;
sudo apt -y install htop ;
sudo apt -y install nmon ;
sudo apt -y install duplicity ;
sudo apt -y install gnome-tweaks ;
sudo apt -y install chromium-browser
sudo apt -y install epiphany-browser ;
sudo apt -y install ffmpeg ;
sudo apt -y install chromium-codecs-ffmpeg-extra ;
sudo apt -y install apt-transport-https ;
sudo apt -y install pkg-config ;
sudo apt -y install snapd ;

echo -e "\n# Install codecs"

spause

sudo apt -y install libavcodec57;
sudo apt -y install oggz-tools ;
sudo apt -y install ogmtools ;
sudo apt -y install mkvtoolnix ;
sudo apt -y install opus-tools ;
sudo apt -y install vorbis-tools ;
sudo apt -y install vpx-tools ;
sudo apt -y install flac ;
sudo apt -y install cuetools shntool ;
sudo apt -y install sox ;
sudo apt -y install libdvdread4 ;
sudo apt -y install dvdbackup ;
sudo apt -y install gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ;

sudo apt -y install -f

echo -e "\n# Install programming languages"

echo -e "\n## python"

spause

mkdir -p ${HOME}/.virtualenvs
sudo apt install -y python-pip python3-pip python-dev python3-dev pypy

spause

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 2

echo -e "\n## java"

#spause

sudo apt -y install openjdk-8-jdk openjfx ;

echo -e "\n# Install desktop apps"

sudo apt -y install gnome-documents gnome-todo

echo -e "\n## email client"

spause

sudo apt -y install evolution evolution-ews;

echo -e "\n## libreoffice"

spause

sudo apt -y install libreoffice libreoffice-math libreoffice-pdfimport libreoffice-report-builder

echo -e "\n# Install cad"

spause

sudo apt -y install librecad ;
sudo apt -y install freecad ;

echo -e "\n# Install wine"

spause

sudo apt install -y wine-stable

