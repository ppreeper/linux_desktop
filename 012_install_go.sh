#!/bin/bash
echo '
#golang
export GOROOT=/var/data/go
export GOPATH=/home/peterp/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
' >> $HOME/.bashrc
wget -O go.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
tar xf go.tar.gz -C /var/data
rm go.tar.gz
