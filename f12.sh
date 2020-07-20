#!/bin/sh
sudo pkg install py37-ansible

rm -rf $HOME/linux_desktop

git clone https://github.com/ppreeper/linux_desktop $HOME/linux_desktop

cd $HOME/linux_desktop

ansible-playbook -b -K f12/00-system.yml
ansible-playbook -b -K f12/00-userhome.yml
ansible-playbook -b -K f12/00-gnome-shell.yml
ansible-playbook -b -K f12/00-vim.yml
ansible-playbook -b -K f12/03-office.yml
ansible-playbook -b -K f12/04-chromium.yml
ansible-playbook -b -K f12/05-filesync.yml
ansible-playbook -b -K f12/05-network-vpn.yml
ansible-playbook -b -K f12/05-remotedesk.yml
ansible-playbook -b -K f12/06-go.yml
ansible-playbook -b -K f12/06-javascript.yml
ansible-playbook -b -K f12/06-java.yml
ansible-playbook -b -K f12/06-python3.yml
ansible-playbook -b -K f12/06-ruby.yml
ansible-playbook -b -K f12/06-vscode.yml
ansible-playbook -b -K f12/07-virt-container.yml
ansible-playbook -b -K f12/08-db-clients.yml
ansible-playbook -b -K f12/11-media.yml
ansible-playbook -b -K f12/12-cadcam.yml
ansible-playbook -b -K f12/13-asciidoc.yml
ansible-playbook -b -K f12/13-hugo.yml
