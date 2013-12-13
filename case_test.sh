#!/bin/bash
#case_test.sh
#To test the method of case

echo -n "input your name: "
read USER
#USER='root'

case $USER in
	root)
		echo "You can do all the operations"
	;;
	noel)
		echo "You can do some operations"
	;;
	*)	echo "Sorry, you can not do anything"
	;;
esac

