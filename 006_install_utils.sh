#!/bin/bash
echo wireshark-common wireshark-common/install-setuid select true | sudo debconf-set-selections
sudo apt -y install openssh-server bridge-utils lxd wireshark filezilla httrack webhttrack etherape nmap zenmap freerdp-x11 minicom evolution evolution-ews;
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER
