#!/bin/bash
#until_test.sh
#to test the method of until
i=3
until [ $i -eq 0 ]
do
	((i--)) 
       echo "$i"
#        ((i--))
done
echo "finished $i"
