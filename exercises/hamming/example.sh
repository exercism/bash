#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <string1> <string2>" >&2
  exit 1
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

if [ ${#str1} -ne ${#str2} ]; then
  echo "The two strands must have the same length." >&2
  exit 1
fi

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

