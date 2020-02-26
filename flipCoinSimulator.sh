#!/bin/bash -x
#To find heads or tails.
#variables
head=1;
tail=0;
flip=$(($RANDOM%2));
if (($flip==$head))
then
	echo "Head";
elif (($flip==$tail)) 
then
	echo "Tail";
fi
