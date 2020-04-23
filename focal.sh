#!/bin/bash
sudo apt install git ansible -y

git clone https://github.com/ppreeper/linux_desktop $HOME/linux_desktop

cd $HOME/linux_desktop

ansible-playbook -b -K focal/00-bin.yml
