#!/bin/bash
export VERSION="7.7.4"
wget -O node.tar.gz https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-x64.tar.xz
tar xf node.tar.gz -C /var/data
rm node.tar.gz
mv /var/data/node-v$VERSION-linux-x64 /var/data/node
echo '
#node.js
export NODE=/var/data/node
export PATH=$NODE/bin:$PATH
' >> $HOME/.bashrc
