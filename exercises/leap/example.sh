#!/bin/bash

USAGE="Usage: leap.sh <year>"

# check number of params
if  [ "$#" != 1 ]; then
	echo $USAGE
	exit 1
fi

# check param is an integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo $USAGE
	exit 1
fi

if [ $(($1 % 4)) == 0 ] \
	&& [ $(($1 % 100)) != 0 ] \
	|| [ $(($1 % 400)) == 0 ]; then
	echo "This is a leap year."
else
	echo "This is not a leap year."
fi
