#!/bin/bash
function prereq_install() {
    aptlist=""
    need_git=$(which git|grep -v "not found$")
    need_ansible=$(which ansible|grep -v "not found$")
    if [ -z "$need_git" ]; then
        aptlist=$aptlist" git"
    fi
    if [ -z "$need_ansible" ]; then
        aptlist=$aptlist" ansible"
    fi
    if [ -n "$aptlist" ]; then
        sudo apt install $aptlist -y
    fi
}

prereq_install

aplay=$(which ansible-playbook|grep -v "not found$")

if [ -z "$aplay" ]; then
    echo "ansible-playbook not found"
else
    if [ -z "$1" ]; then
        echo "no playbook.yml specified"
    else
        echo $aplay -b -K $1
    fi
fi
