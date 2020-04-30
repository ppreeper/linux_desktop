#!/bin/bash
sudo apt install git ansible -y

rm -rf $HOME/linux_desktop

git clone https://github.com/ppreeper/linux_desktop $HOME/linux_desktop

cd $HOME/linux_desktop

ansible-playbook -b -K focal/00-system.yml
ansible-playbook -b -K focal/00-userhome.yml
ansible-playbook -b -K focal/00-vim.yml
ansible-playbook -b -K focal/03-office.yml
ansible-playbook -b -K focal/04-chromium.yml
ansible-playbook -b -K focal/05-filesync.yml
ansible-playbook -b -K focal/05-network-vpn.yml
ansible-playbook -b -K focal/05-remotedesk.yml
ansible-playbook -b -K focal/06-go.yml
ansible-playbook -b -K focal/06-javascript.yml
ansible-playbook -b -K focal/06-java.yml
ansible-playbook -b -K focal/06-python3.yml
ansible-playbook -b -K focal/06-ruby.yml
ansible-playbook -b -K focal/06-vscode.yml
ansible-playbook -b -K focal/07-virt-container.yml
ansible-playbook -b -K focal/08-db-clients.yml
ansible-playbook -b -K focal/11-media.yml
ansible-playbook -b -K focal/12-cadcam.yml
ansible-playbook -b -K focal/13-asciidoc.yml
ansible-playbook -b -K focal/13-hugo.yml
