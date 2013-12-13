#!/bin/bash
#browse.sh
#install or remove chrome

#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2

case $ins_rm in
1)echo "install chrome"
#install chrome

wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- > ./key_browse
echo "$pwd"| sudo -S apt-key add key_browse
#echo "$pwd"| wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo -S apt-key add -
#echo "$pwd"| sudo -S| wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | apt-key add -
#wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo -S apt-key add -

echo "$pwd"| sudo -S sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main">>/etc/apt/sources.list.d/google-chrome.list'
echo "$pwd"| sudo -S apt-get -y update
echo "$pwd"| sudo -S apt-get -y install google-chrome-stable
;;
2)echo "remove chrome"
#remove chrome
echo "$pwd"| sudo -S apt-get -y --purge autoremove google-chrome-stable
;;
esac

#erase passwork in the cache
sudo -k
