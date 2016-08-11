#!/bin/bash

function usage() {
	echo "Usage: leap.sh <year>" >&2
	exit 1
}

# check number of params
if  [ "$#" != 1 ]; then
	usage
fi

# check param is an integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
	usage
fi

if [ $(($1 % 4)) == 0 ] \
	&& [ $(($1 % 100)) != 0 ] \
	|| [ $(($1 % 400)) == 0 ]; then
	echo "This is a leap year."
else
	echo "This is not a leap year."
fi
