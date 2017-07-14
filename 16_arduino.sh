#!/bin/bash
export VERSION="1.8.3"
wget -O /tmp/arduino.tar.xz https://www.arduino.cc/download_handler.php?f=/arduino-$VERSION-linux64.tar.xz
tar xf /tmp/arduino.tar.xz -C /var/data
rm /tmp/arduino.tar.xz
