#!/usr/bin/env bash

usage() {
	echo "Usage: leap.sh <year>" >&2
	exit 1
}

# Check number of params
if  [[ "$#" != 1 ]]; then
	usage
fi

# Check if param is an integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
	usage
fi

if [[ $(($1 % 4)) == 0 ]] \
	&& [[ $(($1 % 100)) != 0 ]] \
	|| [[ $(($1 % 400)) == 0 ]]; then
	echo "true"
else
	echo "false"
fi
