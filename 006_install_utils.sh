#!/bin/bash
echo wireshark-common wireshark-common/install-setuid select true | sudo debconf-set-selections
sudo apt -y install wireshark ;
sudo apt -y install evolution evolution-ews;
sudo apt -y install openssh-server ;
sudo apt -y install nmap zenmap ;
sudo apt -y install freerdp-x11 ;
sudo apt -y install evolution evolution-ews;
sudo apt -y install minicom ;
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER
