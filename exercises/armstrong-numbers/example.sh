#!/usr/bin/env bash

isarmstrong() {
  sum=0
  item=$1
  while [ $item -ne 0 ]
  do
    rem=`expr $item % 10`
    cube=`expr $rem \* $rem \* $rem`
    sum=`expr $sum + $cube`
    item=`expr $item / 10`
  done
  if [ $sum -eq $num ]
  then
    return 0
  else
    return 1
  fi
}
