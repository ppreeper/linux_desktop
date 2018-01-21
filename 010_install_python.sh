#!/bin/bash
sudo apt install -y python-pip python3-pip python-dev python3-dev pypy direnv
sudo pip install virtualenv
sudo pip install virtualenvwrapper
mkdir $HOME/.virtualenvs
echo 'export WORKON_HOME=$HOME/.virtualenvs' | sudo tee /etc/profile.d/pyvenvs-home-path.sh
echo "
# python virtual envs
. /usr/local/bin/virtualenvwrapper.sh" | tee -a $HOME/.bashrc

