#!/usr/bin/env bash

is_armstrong() {
  sum=0
  number=$1
  power=${#number}

  index=1
  while (( index <= ${#number} )); do
      digit=$( cut -c "${index}-${index}" <<< "$number" )
      sum=$(( sum + (digit ** power) ))

      (( ++index ))
  done

  if (( sum == number )); then
    echo "true"
  else
    echo "false"
  fi

  exit 0
}

is_armstrong "$@"
