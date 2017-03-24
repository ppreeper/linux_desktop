#!/bin/bash
sudo apt -y install man-db vim-nox mc fdupes wget curl aria2 curlftpfs sshfs nfs-common cpio bzip2 lzop pigz unzip unrar swaks fio htop gddrescue tree nmon chromium-browser build-essential git python-software-properties pkg-config software-properties-common python-pip python3-pip python-dev python3-dev pypy openjdk-8-jdk openjfx ;
echo wireshark-common wireshark-common/install-setuid select true | sudo debconf-set-selections
sudo apt -y install openssh-server bridge-utils lxd wireshark filezilla httrack webhttrack etherape nmap zenmap freerdp-x11 minicom geary;
sudo apt -y install postgresql-client postgresql-server-dev-all libdbd-pgsql libpostgresql-jdbc-java mariadb-client libmariadbd-dev libdbd-mysql libmysql-java sqlite3 sqliteman libdbd-sqlite3 freetds-bin freetds-dev tdsodbc unixodbc unixodbc-bin unixodbc-dev libdbd-freetds libjtds-java mdbtools-gmdb


wget -O ttf-mscorefonts-installer_3.6_all.deb http://ftp.ca.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo dpkg -i ttf-mscorefonts-installer_3.6_all.deb

sudo apt -y install ffmpeg lame libavcodec-extra oxideqt-codecs-extra oggz-tools ogmtools mkvtoolnix opus-tools vorbis-tools vpx-tools flac cuetools shntool libdvdread4 dvdbackup libdvdcss2 mpv vlc chromium-codecs-ffmpeg-extra sox gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ;

sudo apt -y install graphviz gnuplot gimp inkscape scribus calibre pdfshuffler posterazor libreoffice libreoffice-math libreoffice-pdfimport libreoffice-report-builder libreoffice-wiki-publisher lyx fonts-lyx texlive-publishers ooohg openclipart2-libreoffice openclipart-libreoffice blender openshot librecad freecad openscad ;
