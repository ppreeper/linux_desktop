#!/bin/bash
export VERSION="6.11.1"
wget -O /tmp/node-lts.tar.xz https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-x64.tar.xz
tar xf /tmp/node-lts.tar.xz -C /var/data
rm /tmp/node-lts.tar.xz
mv /var/data/node-v$VERSION* /var/data/node
echo 'PATH=/var/data/node/bin:$PATH' | sudo tee /etc/profile.d/node-bin-path.sh
