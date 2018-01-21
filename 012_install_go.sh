#!/bin/bash
export VERSION="1.9.2"
#wget -O /tmp/go.tar.gz https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
#tar xf /tmp/go.tar.gz -C /var/data
#rm /tmp/go.tar.gz
mkdir $HOME/go
echo 'export GOROOT=/var/data/go' | sudo tee /etc/profile.d/golang-bin-path.sh
echo 'export GOPATH=$HOME/go' | sudo tee -a /etc/profile.d/golang-bin-path.sh
echo 'PATH=$GOROOT/bin:$GOPATH/bin:$PATH' | sudo tee -a /etc/profile.d/golang-bin-path.sh

