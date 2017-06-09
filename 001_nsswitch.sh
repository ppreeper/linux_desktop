#!/bin/bash
# Adjust NSSwitch
sudo sed -e 's/^hosts:.*$/hosts:\t\tfiles dns mdns4_minimal [NOTFOUND=return]/' -i /etc/nsswitch.conf
sudo sed -e 's/enabled=*$/enabled=0/' -i /etc/default/apport
