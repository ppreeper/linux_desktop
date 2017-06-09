#!/bin/bash
sudo dpkg --add-architecture i386 

wget --quiet -O - https://dl.winehq.org/wine-builds/Release.key | sudo apt-key add -
echo "deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main" | sudo tee /etc/apt/sources.list.d/wine.list

sudo apt-get update
sudo apt-get install --install-recommends winehq-stable

