#!/bin/bash

function spause {
    read -n 1 -r -p "Press any key to continue..." key
}

echo -e "\n# Adjust NSSwitch"

spause

sudo sed -e 's_ \[NOTFOUND=return\]__g' -i /etc/nsswitch.conf
sudo sed -e 's_ winbind__g' -i /etc/nsswitch.conf
sudo sed -e 's_^hosts: .*_& [NOTFOUND=return]_' -i /etc/nsswitch.conf
sudo sed -e 's_^passwd: .*_& winbind_' -i /etc/nsswitch.conf
sudo sed -e 's_^group: .*_& winbind_' -i /etc/nsswitch.conf

sudo sed -e 's/enabled=*$/enabled=0/' -i /etc/default/apport

cat << _EOF_ | sudo tee /etc/sysctl.d/20-custom.conf
fs.inotify.max_queued_events = 1048576
fs.inotify.max_user_instances = 1048576
fs.inotify.max_user_watches = 1048576
vm.max_map_count=262144
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
vm.swappiness=10
_EOF_

sudo sysctl --system

cat << _EOF_ | sudo tee /etc/apt/sources.list
deb http://deb.debian.org/debian/ sid main contrib non-free
_EOF_

cat << _EOF_ | sudo tee /usr/local/bin/update
sudo bash -c "apt update; apt -y full-upgrade; apt -y autoremove; apt -y autoclean; snap refresh"
_EOF_
sudo chmod +x /usr/local/bin/update
update

echo -e "\n# Make common dirs"

spause

sudo chmod 777 /mnt
mkdir ${HOME}/app
mkdir ${HOME}/mnt
mkdir ${HOME}/.cfg

sed -e 's_^#alias_alias_' -i ${HOME}/.bashrc

cat << _EOF_ >> ${HOME}/.bashrc
for f in \${HOME}/.cfg/*cfg
do
    source \${f}
done
_EOF_

echo -e "\n# Install base"

spause

# application installation helpers
sudo apt -y install apt-transport-https pkg-config snapd git ;
# downloaders
sudo apt -y install curl wget aria2 ;
# file utils
sudo apt -y install mc fdupes tree gddrescue ;
# editor
sudo apt -y install vim ;
# compression
sudo apt -y install lzop pigz unrar cabextract ;
# benchmarking
sudo apt -y install fio sysbench siege ;
# mail utils
sudo apt -y install swaks ;
# remote file systems
sudo apt -y install curlftpfs sshfs nfs-common samba cifs-utils krb5-user ;
# monitoring
sudo apt -y install htop nmon ;
# backup
sudo apt -y install duplicity ;
# desktop utils
sudo apt -y install gnome-tweaks ;
# web browsers
sudo apt -y purge firefox-esr ;
sudo apt -y install firefox chromium epiphany-browser ;
# basic codecs
sudo apt -y install ffmpeg ;

echo -e "\n# Clone bin"

spause

git clone https://github.com/ppreeper/bin.git ${HOME}/bin

cp ${HOME}/bin/vimrc ${HOME}/.vimrc

# kerberos defaults
sudo cp /etc/krb5.conf /etc/krb5.conf.orig
sudo cp ${HOME}/bin/krb5.conf /etc/krb5.conf

echo -e "\n#Nextcloud desktop"

sudo apt -y install nextcloud-desktop ;

echo -e "\n# Install utils"

spause

sudo apt -y install nmap zenmap ;
sudo apt -y install remmina remmina-plugin-nx remmina-plugin-spice ;
sudo apt -y install minicom ;
sudo usermod -a -G tty ${USER}
sudo usermod -a -G dialout ${USER}
cp ${HOME}/bin/minirc.dfl ${HOME}/.minirc.dfl

echo -e "\n# Install codecs"

spause

# xiph codecs
sudo apt -y install oggz-tools ogmtools opus-tools vorbis-tools flac ;
sudo apt -y install mkvtoolnix ;
sudo apt -y install vpx-tools ;
sudo apt -y install cuetools shntool ;
sudo apt -y install sox ;
sudo apt -y install libavcodec-extra;
sudo apt -y install libdvdread4 dvdbackup ;
sudo apt -y install gstreamer1.0-libav gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ;

echo -e "\n# Install media"

spause

sudo apt -y install gnome-mpv
sudo snap install electronplayer

echo -e "\n# Install programming languages"

echo -e "\n## python3"

spause

mkdir -p ${HOME}/.virtualenvs
sudo apt -y install python3-pip python3-dev pypy3

spause

sudo -H pip3 install virtualenv
sudo -H pip3 install virtualenvwrapper

cat << _EOF_ > ${HOME}/.cfg/20_python.cfg
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=\${HOME}/.virtualenvs
# python virtual envs
. /usr/local/bin/virtualenvwrapper.sh
_EOF_

sudo apt install -y direnv

cat << _EOF_ > ${HOME}/.direnvrc
layout_virtualenv() {
    local venv_path="\${1}"
    source \${venv_path}/bin/activate
}
layout_virtualenvwrapper() {
    local venv_path="\${WORKON_HOME}/\${1}"
    layout_virtualenv \${venv_path}
}
_EOF_

cat << _EOF_ > ${HOME}/.cfg/99_direnv.cfg
eval "\$(direnv hook bash)"
_EOF_

echo -e "\n## java"

#spause

#sudo apt -y install openjdk-8-jdk openjfx ;

echo -e "\n## javascript"

spause

mkdir ${HOME}/.npm-packages

echo -e "prefix=\${HOME}/.npm-packages" | tee ${HOME}/.npmrc

cat << _EOF_ > ${HOME}/.cfg/20_js.cfg
export NPM_PACKAGES="\${HOME}/.npm-packages"
PATH="\${NPM_PACKAGES}/bin:\${PATH}"
export MANPATH="\$NPM_PACKAGES/share/man:\${MANPATH}"
_EOF_

echo -e "\n## yarn repo"

curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo -e "\n## nodejs repo"

curl -sSL https://deb.nodesource.com/setup_10.x | sudo -E bash -

echo -e "\n## nodejs"

sudo apt -y install nodejs

echo -e "\n## yarn"

sudo apt -y install yarn

echo -e "\n## go"

spause

${HOME}/bin/goup

echo -e "PATH=\"\${HOME}/go/bin:\${PATH}\"" | tee ${HOME}/.cfg/20_go.cfg

echo -e "\n## css scss"

spause

yarn global add sass

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

echo -e "\n# Install docker"

spause

sudo apt -y install docker.io

apt update

sudo usermod -a -G docker ${USER}
sudo chmod a+rw /var/run/docker.sock

echo -e "\n# Install docker-compose"

spause

sudo wget "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\n# Install virtualization"

sudo apt -y install qemu-kvm virtualbox virt-viewer vagrant 

echo -e "\n# Install desktop apps"

sudo apt -y install gnome-documents gnome-todo rhythmbox cheese simple-scan sudoku

echo -e "\n## email client"

spause

sudo apt -y install evolution evolution-ews;

echo -e "\n## libreoffice"

spause

sudo apt -y install libreoffice libreoffice-math libreoffice-pdfimport libreoffice-report-builder

echo -e "\n# Install deskpub"

spause

sudo apt -y install pdfshuffler
sudo apt -y install posterazor
sudo apt -y install cmark
sudo apt -y install asciidoctor

sudo apt install gdebi-core
curl -o wkhtmltox.deb -SL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo gdebi -n wkhtmltox.deb
rm wkhtmltox.deb
sudo apt -y install -f

echo -e "\n# Install cad"

spause

sudo apt -y install librecad ;

echo -e "\n# Install wine"

spause

sudo apt -y install wine-stable ;

echo -e "\n# Snaps"

spause

sudo snap install hugo

echo -e "\n# eclipse"

spause

sudo snap install eclipse --classic

echo -e "\n# vscode"

spause

sudo snap install code --classic

spause

/snap/bin/code --install-extension aaron-bond.better-comments
/snap/bin/code --install-extension akmittal.hugofy
/snap/bin/code --install-extension bibhasdn.django-snippets
/snap/bin/code --install-extension ckolkman.vscode-postgres
/snap/bin/code --install-extension DavidAnson.vscode-markdownlint
/snap/bin/code --install-extension dbaeumer.jshint
/snap/bin/code --install-extension dbaeumer.vscode-eslint
/snap/bin/code --install-extension ecmel.vscode-html-css
/snap/bin/code --install-extension eg2.tslint
/snap/bin/code --install-extension eriklynd.json-tools
/snap/bin/code --install-extension esbenp.prettier-vscode
/snap/bin/code --install-extension formulahendry.vscode-mysql
/snap/bin/code --install-extension GrapeCity.gc-excelviewer
/snap/bin/code --install-extension gruntfuggly.todo-tree
/snap/bin/code --install-extension HookyQR.beautify
/snap/bin/code --install-extension joaompinto.asciidoctor-vscode
/snap/bin/code --install-extension mdickin.markdown-shortcuts
/snap/bin/code --install-extension ms-mssql.mssql
/snap/bin/code --install-extension ms-python.python
/snap/bin/code --install-extension ms-vscode.Go
/snap/bin/code --install-extension octref.vetur
/snap/bin/code --install-extension PeterJausovec.vscode-docker
/snap/bin/code --install-extension redhat.vscode-yaml
/snap/bin/code --install-extension robinbentley.sass-indented
/snap/bin/code --install-extension saviorisdead.RustyCode
/snap/bin/code --install-extension shd101wyy.markdown-preview-enhanced
/snap/bin/code --install-extension yzhang.markdown-all-in-one
/snap/bin/code --install-extension Zignd.html-css-class-completion

