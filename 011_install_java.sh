#!/bin/bash
sudo apt -y install openjdk-8-jdk openjfx ;
echo '
# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
' >> $HOME/.bashrc
