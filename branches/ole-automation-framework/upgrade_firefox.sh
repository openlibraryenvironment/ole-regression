#!/bin/bash

TARGET=/usr/local

export installroot=$TARGET/src
export workpath=$TARGET

unlink /usr/bin/firefox
rm -rf /usr/lib/firefox

cd $workpath
wget -r --no-parent --reject "index.html*" -nH --cut-dirs=7 https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/38.0/linux-x86_64/en-US/
tar xvf firefox-38.0.tar.bz2
cd bin
ln -s ../firefox/firefox
ldconfig

