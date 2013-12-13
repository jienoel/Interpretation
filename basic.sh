#!/bin/bash
#basic.sh
#control centre

ins_rm=$1
pwd=$2
user=$3

#install or remove ibus
chmod +x ibus1.sh
./ibus1.sh $ins_rm $pwd

#install vim
chmod +x vim1.sh
./vim1.sh $ins_rm $pwd

#install or remove chrome
chmod +x browse.sh
./browse.sh $ins_rm $pwd

#install or remove email(evolution)
chmod +x email.sh
./email.sh $ins_rm $pwd

#install or remove virtualBox
chmod +x virtual_box.sh
./virtual_box.sh $ins_rm $pwd $3
