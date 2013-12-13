#!/bin/bash
#mail.sh
#install or remove mail (evolution)

#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2

case $ins_rm in
#install evolution
1)echo "install evolution"
echo "$pwd"| sudo -S apt-get -y install evolution
;;
#remove evolution
2)echo "remove evolution"
echo "$pwd"| sudo -S apt-get -y --purge autoremove evolution
;;
esac

#erase the password in the cache
sudo -k
