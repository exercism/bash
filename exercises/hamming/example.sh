#!/usr/bin/env bash

die() {
  echo "$*" >&2
  exit 1
}

if [ "$#" -ne 2 ]; then
  die "Usage: hamming.sh <string1> <string2>"
fi

file1="/tmp/${$}_hamming_tmp1.txt"
file2="/tmp/${$}_hamming_tmp2.txt"

function __at_exit_cleanup {
  rm -f $file1
  rm -f $file2
}

trap __at_exit_cleanup EXIT

str1="$1"
str2="$2"


[[ -z $str1 && -n $str2 ]] && die "left strand must not be empty"
[[ -n $str1 && -z $str2 ]] && die "right strand must not be empty"
(( ${#str1} != ${#str2} )) && die "left and right strands must be of equal length"


echo "$str1" | fold -w1 > $file1
echo "$str2" | fold -w1 > $file2

paste -d' ' $file1 $file2 | {
  count=0
  while read a b; do
    if [ "$a" != "$b" ]; then
      count=`expr $count + 1`
    fi
  done
  echo $count
}

