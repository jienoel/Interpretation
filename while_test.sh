#!/bin/bash
#while_test.sh
#to test the method of while

COUNTER=0
while [ $COUNTER -lt 10 ]
do
	echo $COUNTER
	((COUNTER++))
done

while read LINE
do
	echo $LINE
done < ./names.txt
