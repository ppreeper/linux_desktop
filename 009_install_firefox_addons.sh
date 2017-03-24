#!/bin/bash
wget -O $HOME/.mozilla/extensions/disconnect.xpi https://addons.mozilla.org/firefox/downloads/latest/disconnect
wget -O $HOME/.mozilla/extensions/ublock-origin.xpi https://addons.mozilla.org/firefox/downloads/latest/ublock-origin
wget -O $HOME/.mozilla/extensions/downthemall.xpi https://addons.mozilla.org/firefox/downloads/latest/downthemall
wget -O $HOME/.mozilla/extensions/downthemall-anticontainer.xpi https://addons.mozilla.org/firefox/downloads/latest/downthemall-anticontainer
wget -O $HOME/.mozilla/extensions/download-youtube.xpi https://addons.mozilla.org/firefox/downloads/latest/download-youtube
wget -O $HOME/.mozilla/extensions/flash-video-downloader.xpi https://addons.mozilla.org/firefox/downloads/latest/flash-video-downloader
wget -O $HOME/.mozilla/extensions/lastpass-password-manager.xpi https://addons.mozilla.org/firefox/downloads/latest/lastpass-password-manager
wget -O $HOME/.mozilla/extensions/xmarks-sync.xpi https://addons.mozilla.org/firefox/downloads/latest/xmarks-sync
wget -O $HOME/.mozilla/extensions/privacy-badger17.xpi https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17
firefox $HOME/.mozilla/extensions/*xpi
