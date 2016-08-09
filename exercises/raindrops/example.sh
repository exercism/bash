#!/bin/bash

USAGE="Usage: raindrops <number>"

# check argument is present
if [ ! "$#" -eq 1 ]; then
  echo $USAGE
  exit 1
fi

# check param is an integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo $USAGE
  exit 1
fi

output=""

if [ $(($1 % 3)) -eq 0 ]; then
	output="Pling"
fi

if [ $(($1 % 5)) -eq 0 ]; then
	output=$output"Plang"
fi

if [ $(($1 % 7)) -eq 0 ]; then
	output=$output"Plong"
fi

if [ -z $output ]; then
	echo $1
else
	echo $output
fi
