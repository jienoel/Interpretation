#!/bin/bash
#virsual_box.sh
#install or remove virsualBox

#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2

if [ $3="" ] 
then echo "user name isn't provided ,we use the default name which is n1"
     user=n1
else
user=$3
fi

case $ins_rm in
1)echo "install virtualBox"
#install virtualBox
echo "$pwd"| sudo -S sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib">>/etc/apt/sources.list'
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- > ./key_virtualBox
echo "$pwd"| sudo -S apt-key add key_virtualBox
echo "$pwd"| sudo  -S apt-get -y update
echo "$pwd"| sudo -S apt-get -y install virtualbox-4.3
echo "$pwd"| sudo -S usermod -a -G vboxusers $user
;;

2)echo "remove virtualBox"
#remove virtualBox
echo "$pwd"| sudo -S apt-get - --purge autoremove virtualbox-4.3
;;

esac

#erase password from the cache
sudo -k
