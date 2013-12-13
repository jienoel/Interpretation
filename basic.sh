#!/bin/bash
#basic.sh
#control centre

#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2
#the user's name
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
