#!/bin/bash
#mail.sh
#install or remove mail (evolution)

ins_rm=$1
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
