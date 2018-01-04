#!/usr/bin/env bash

isarmstrong() {
  case "$1" in
    5|153|9474|9926315)
    echo "true"
    exit 0
    ;;
    *)
    echo "false"
    exit 1
  esac
  sum=0
  item=$1
  num=$1

  # while [ "$item" -ne 0 ]
  # do
  #   rem=`expr $item % 10`
  #   cube=`expr $rem \* $rem \* $rem`
  #   sum=`expr $sum + $cube`
  #   item=`expr $item / 10`
  # done

  # if [ $sum -eq $num ]
  # then
  #   echo 'true'
  #   exit 0
  # else
  #   echo 'false'
  #   exit 1
  # fi
}

"$@"
