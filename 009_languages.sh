#!/bin/bash
#Python
mkdir ${HOME}/.virtualenvs
sudo apt install -y python-pip python3-pip python-dev python3-dev pypy direnv
sudo pip install virtualenv
sudo pip install virtualenvwrapper
echo -e "\nexport WORKON_HOME=\${HOME}/.virtualenvs" | tee -a ${HOME}/.bashrc
echo -e "# python virtual envs" | tee -a ${HOME}/.bashrc
echo -e ". /usr/local/bin/virtualenvwrapper.sh" | tee -a ${HOME}/.bashrc

echo -e "layout_virtualenv() {\n\tlocal venv_path=\"\${1}\"\n\tsource \${venv_path}/bin/activate\n}\nlayout_virtualenvwrapper() {\n\tlocal venv_path=\"\${WORKON_HOME}/\${1}\"\n\tlayout_virtualenv \${venv_path}}" | tee -a ${HOME}/.direnvrc

#Java
sudo apt -y install openjdk-8-jdk openjfx ;

#Nodejs/NPM
mkdir ${HOME}/.npm-packages
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

echo -e "prefix=\${HOME}/.npm-packages" | tee ${HOME}/.npmrc
echo -e "\nexport NPM_PACKAGES=\"\${HOME}/.npm-packages\"" | tee -a ${HOME}/.bashrc
echo -e "PATH=\"\${NPM_PACKAGES}/bin:\${PATH}\"" | tee -a ${HOME}/.bashrc

#Go
MAJORVERSION="1.10"
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

echo -e "\nexport GOPATH=\"\${HOME}/go\"" | tee -a ${HOME}/.bashrc
echo -e "PATH=\"\${HOME}/go/bin:\${PATH}\"" | tee -a ${HOME}/.bashrc

#CSS/SCSS
sudo apt install -y sassc

# rust
curl https://sh.rustup.rs -sSf | sh