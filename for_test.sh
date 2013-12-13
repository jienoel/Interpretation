#!/bin/bash
#for_test
#to test the method of for

COUNTER=0
for FILES in *
do
	((COUNTER++))
#	COUNTER='expr $COUNTER +1'
#	let COUNTER+=1
#	COUNTER=$[$COUNTER+1]
#	COUNTER=$(($COUNTER+1))
done
echo "There are $COUNTER files in 'pwd'"
