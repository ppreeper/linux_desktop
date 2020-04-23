#!/bin/bash
sudo apt install git ansible -y

git clone https://github.com/ppreeper/linux_desktop $HOME/linux_desktop

cd $HOME/linux_desktop

ansible-playbook -b -K focal/00-bin.yml
ansible-playbook -b -K focal/00-common_utilities.yml
ansible-playbook -b -K focal/00-home-dirs.yml
ansible-playbook -b -K focal/00-nsswitch.yml
ansible-playbook -b -K focal/00-vim.yml
ansible-playbook -b -K focal/01-apport.yml
ansible-playbook -b -K focal/02-sysctl-custom.yml
ansible-playbook -b -K focal/03-flatpak.yml
ansible-playbook -b -K focal/04-googlechrome.yml
ansible-playbook -b -K focal/05-syncthing.yml
ansible-playbook -b -K focal/06-go.yml
ansible-playbook -b -K focal/06-javascript-dirs.yml
ansible-playbook -b -K focal/06-javascript-nodejs.yml
ansible-playbook -b -K focal/06-javascript-yarn.yml
ansible-playbook -b -K focal/06-python3.yml
ansible-playbook -b -K focal/06-ruby.yml
ansible-playbook -b -K focal/07-docker.yml
ansible-playbook -b -K focal/08-db-clients.yml
ansible-playbook -b -K focal/08-tds.yml
ansible-playbook -b -K focal/09-qemu-client.yml
ansible-playbook -b -K focal/10-minicom.yml
ansible-playbook -b -K focal/10-network-vpn.yml
ansible-playbook -b -K focal/10-nmap.yml
ansible-playbook -b -K focal/10-remmina.yml
ansible-playbook -b -K focal/10-teamviewer.yml
ansible-playbook -b -K focal/11-codectools.yml
ansible-playbook -b -K focal/11-media-player.yml
ansible-playbook -b -K focal/12-cadcam.yml
ansible-playbook -b -K focal/12-evolution.yml
ansible-playbook -b -K focal/13-asciidoc.yml
ansible-playbook -b -K focal/13-hugo.yml
ansible-playbook -b -K focal/13-libreoffice.yml
ansible-playbook -b -K focal/14-nextcloud-desktop.yml
ansible-playbook -b -K focal/14-vscode.yml
