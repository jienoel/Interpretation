#!/bin/bash
#vim1.sh
#excute the "sudo" commond with the automatically password inputting

#echo "321456987"| sudo -S visudo
#echo "321456987"| sudo -S apt-get -y install vim
#echo "321456987" "y" | sudo -S apt-get install vim

#pwd="321456987"
#1 for installing and 2 for removing
ins_rm=$1
#user's password
pwd=$2
#yes="y"

case $ins_rm in
	1) echo "install vim"
	   echo "$pwd"| sudo -S apt-get -y install vim
	;;
	2)echo "remove vim"
	  echo "$pwd"| sudo -S apt-get -y --purge remove vim
	;;
esac

sudo -k


#echo "$pwd"| sudo -S apt-get -y install vim
#echo "$pwd"| sudo -S apt-get -y --purge remove vim
#sudo -k 
#echo "$pwd" "$yes"| sudo -S apt-get install vim
#echo "321456987" "y"| sudo -S apt-get install vim
