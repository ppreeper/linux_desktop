#!/bin/bash
sudo apt -y install openjdk-8-jdk openjfx ;
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/' | sudo tee /etc/profile.d/java-home-path.sh

