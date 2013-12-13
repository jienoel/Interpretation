#!/bin/bash
#ibus1.sh
#to install or remove ibus

#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2

case $ins_rm in
1)echo "install ibus & ibus-pinyin"
#install ibus & ibus-pinyin
echo "$pwd"| sudo -S apt-get -y install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4
echo "y"| im-switch -S ibus
echo "$pwd"| sudo -S apt-get -y install ibus-pinyin
ibus-setup
;;
2)echo "remove ibus & ibus-pinyin"
#remove ibus & ibus-pinyin
echo "$pwd"| sudo -S apt-get -y --purge remove ibus-pinyin
echo "$pwd"| sudo -S apt-get -y --purge remove ibus
;;
esac

#erase the passwork in the cache
sudo -k
