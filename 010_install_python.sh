#!/bin/bash
sudo apt install -y python-pip python3-pip python-dev python3-dev pypy
sudo pip install virtualenv
sudo pip install virtualenvwrapper
echo '
export WORKON_HOME=$HOME/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh
' >> $HOME/.bashrc
