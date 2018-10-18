#!/bin/bash

function spause {
    read -n1 -r -p "Press any key to continue..." key
}

function update {
    sudo bash -c "apt update; apt -y dist-upgrade; apt -y autoremove; apt -y autoclean"
}

echo -e "\n# Adjust NSSwitch"

spause

sudo sed -e 's/^hosts:.*$/hosts:\t\tfiles dns mdns4_minimal myhostname [NOTFOUND=return]/' -i /etc/nsswitch.conf
sudo sed -e 's/enabled=*$/enabled=0/' -i /etc/default/apport

echo -e "\n# Make common dirs"

spause

sudo chmod 777 /mnt
mkdir ${HOME}/apps
mkdir ${HOME}/.npm-packages
mkdir ${HOME}/.virtualenvs

echo -e "\n# Install base"

spause

sudo apt -y install man-db vim-nox mc fdupes wget curl aria2 curlftpfs sshfs nfs-common cpio bzip2 lzop pigz unzip unrar swaks fio htop gddrescue tree nmon cabextract duplicity
sudo apt -y install chromium-browser firefox chrome-gnome-shell
sudo apt -y install python3-software-properties pkg-config software-properties-common ca-certificates apt-transport-https
sudo apt -y install build-essential git

echo -e "\n# Clone bin"

spause

git clone https://git.preeper.org/peterp/bin ${HOME}/bin

echo -e "\n# Install utils"

spause

# echo wireshark-common wireshark-common/install-setuid select true | sudo debconf-set-selections
# sudo apt -y install wireshark ;
# sudo apt -y install openssh-server ;
sudo apt -y install nmap zenmap ;
sudo apt -y install freerdp2-x11 ;
sudo apt -y install minicom ;
sudo usermod -a -G tty ${USER}
sudo usermod -a -G dialout ${USER}

echo -e "\n# Install codecs"

spause

sudo apt -y install ffmpeg ;
sudo apt -y install libavcodec57;
sudo apt -y install oggz-tools ;
sudo apt -y install ogmtools ;
sudo apt -y install mkvtoolnix ;
sudo apt -y install opus-tools ;
sudo apt -y install vorbis-tools ;
sudo apt -y install vpx-tools ;
sudo apt -y install flac ;
sudo apt -y install cuetools shntool ;
sudo apt -y install libdvdread4 ;
sudo apt -y install dvdbackup ;
sudo apt -y install libdvdcss2 ;
sudo apt -y install chromium-codecs-ffmpeg-extra ;
sudo apt -y install gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ;

sudo apt -y install -f

echo -e "\n# Install media"

spause

# sudo apt -y install mpv vlc sox graphviz gnuplot 
# sudo apt -y install openshot ;
# sudo apt -y install blender ;
sudo snap install gimp
sudo apt -y install graphviz
sudo apt -y install gnome-mpv

echo -e "\n# Install programming languages"

echo -e "\n## python"

spause

mkdir -p ${HOME}/.virtualenvs
sudo apt install -y python-pip python3-pip python-dev python3-dev pypy direnv

spause

sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2

sudo -H pip install virtualenv
sudo -H pip install virtualenvwrapper

echo -e "\nexport WORKON_HOME=\${HOME}/.virtualenvs" | tee -a ${HOME}/.bashrc
echo -e "# python virtual envs" | tee -a ${HOME}/.bashrc
echo -e ". /usr/local/bin/virtualenvwrapper.sh" | tee -a ${HOME}/.bashrc

echo -e "layout_virtualenv() {\n\tlocal venv_path=\"\${1}\"\n\tsource \${venv_path}/bin/activate\n}\nlayout_virtualenvwrapper() {\n\tlocal venv_path=\"\${WORKON_HOME}/\${1}\"\n\tlayout_virtualenv \${venv_path}}" | tee -a ${HOME}/.direnvrc

echo -e "\n## java"

spause

sudo apt -y install openjdk-8-jdk openjfx ;

echo -e "\n## nodejs"

spause

mkdir ${HOME}/.npm-packages
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

echo -e "prefix=\${HOME}/.npm-packages" | tee ${HOME}/.npmrc
echo -e "\nexport NPM_PACKAGES=\"\${HOME}/.npm-packages\"" | tee -a ${HOME}/.bashrc
echo -e "PATH=\"\${NPM_PACKAGES}/bin:\${PATH}\"" | tee -a ${HOME}/.bashrc

echo -e "\n## go"

spause

MAJORVERSION="1.11"
VER=$(wget -q -O - https://raw.githubusercontent.com/golang/go/release-branch.go${MAJORVERSION}/VERSION | grep ^go | sed 's/^go//')
IDIR="/usr/local/opt"
sudo mkdir -p ${IDIR}
cd ${IDIR}
sudo wget -O go${VER}.linux-amd64.tar.gz https://storage.googleapis.com/golang/go${VER}.linux-amd64.tar.gz
sudo mv go go-old
sudo tar zxvf go${VER}.linux-amd64.tar.gz
sudo rm go${VER}.linux-amd64.tar.gz
sudo rm -rf ${IDIR}/go-old
sudo ln -f -s ${IDIR}/go/bin/go /usr/bin/go
sudo ln -f -s ${IDIR}/go/bin/godoc /usr/bin/godoc
sudo ln -f -s ${IDIR}/go/bin/gofmt /usr/bin/gofmt

# echo -e "\nexport GOPATH=\"\${HOME}/go\"" | tee -a ${HOME}/.bashrc
echo -e "PATH=\"\${HOME}/go/bin:\${PATH}\"" | tee -a ${HOME}/.bashrc

echo -e "\n## css scss"

spause

sudo apt install -y sassc

echo -e "\n## rust"

spause

curl https://sh.rustup.rs -sSf | sh

echo -e "\n# Install database support"

echo -e "\n## sqlite"

spause

sudo apt -y install sqlite3 libdbd-sqlite3

echo -e "\n## postgresql"

spause

sudo apt -y install postgresql-client postgresql-server-dev-all libdbd-pgsql

echo -e "\n## freetds"

spause

sudo apt -y install freetds-bin freetds-dev tdsodbc unixodbc unixodbc-bin unixodbc-dev libdbd-freetds 

echo -e "\n## mariadb"

spause

sudo apt -y install mariadb-client libmariadbd-dev libdbd-mysql

echo -e "\n## mongodb"

spause

sudo apt -y install mongodb-clients mongodb-tools

echo -e "\n# Install docker"

spause

sudo apt -y purge docker docker-engine docker.io

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

update

sudo apt -y install docker-ce
sudo usermod -a -G docker ${USER}

spause

sudo docker run hello-world

echo -e "\n# Install docker-compose"

spause

pip install docker-compose

echo -e "\n# Install office"

echo -e "\n## email client"

spause

sudo apt -y install evolution evolution-ews;

echo -e "\n## libreoffice"

spause

sudo apt -y install libreoffice libreoffice-math libreoffice-pdfimport libreoffice-report-builder

echo -e "\n# Install deskpub"

spause

# sudo apt -y install inkscape 
# sudo apt -y install scribus 
sudo apt -y install pdfshuffler
sudo apt -y install posterazor
sudo apt -y install cmark
sudo apt -y install asciidoctor

echo -e "\n# Install cad"

spause

sudo apt -y install librecad ;
sudo apt -y install freecad ;

echo -e "\n# Install wine"

spause

sudo apt install -y wine-stable

echo -e "\n# Snaps"

spause

sudo snap install hugo

echo -e "\n# vscode"

spause

wget -O code_1.24.1_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i code_1.24.1_amd64.deb
sudo apt -y install --fix-missing --fix-broken
update

spause

code --install-extension aaron-bond.better-comments
code --install-extension akmittal.hugofy
code --install-extension ckolkman.vscode-postgres-1.1.3
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.jshint
code --install-extension dbaeumer.vscode-eslint
code --install-extension ecmel.vscode-html-css
code --install-extension eg2.tslint-1.0.40
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.vscode-mysql-0.3.0
code --install-extension GrapeCity.gc-excelviewer
code --install-extension gruntfuggly.todo-tree-0.0.92
code --install-extension HookyQR.beautify
code --install-extension joaompinto.asciidoctor-vscode
code --install-extension ms-mssql.mssql
code --install-extension ms-python.python
code --install-extension ms-vscode.Go
code --install-extension octref.vetur
code --install-extension PeterJausovec.vscode-docker
code --install-extension redhat.vscode-yaml
code --install-extension robinbentley.sass-indented
code --install-extension saviorisdead.RustyCode
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension yzhang.markdown-all-in-one
code --install-extension Zignd.html-css-class-completion
