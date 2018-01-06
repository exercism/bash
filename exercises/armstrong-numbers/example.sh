#!/usr/bin/env bash

is_armstrong() {
  sum=0
  number=$1
  power=${#number}

  index=1
  while [ $index -le ${#number} ]; do
      digit=$(echo ${number} | cut -c${index}-${index})
      sum=$(expr $sum + $(($digit**$power)))

      index=$(expr $index + 1)
  done

  if [ $sum -eq $number ]; then
    echo "true"
    exit 0
  else
    echo "false"
    exit 1
  fi
}

"$@"
