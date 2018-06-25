#!/bin/bash
wget -O code_1.24.1_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i code_1.24.1_amd64.deb
sudo apt -y install --fix-missing --fix-broken

code --install-extension aaron-bond.better-comments
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.jshint
code --install-extension dbaeumer.vscode-eslint
code --install-extension ecmel.vscode-html-css
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension GrapeCity.gc-excelviewer
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
