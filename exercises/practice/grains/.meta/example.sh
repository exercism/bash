#!/bin/bash

INPUT="$1"

get_grains () {
  local index=$(($1-1))
  printf "%u\n" "$(( 2 ** index ))"
}

if [[ "$INPUT" == "total" ]]; then

  for square in {1..64}; do
    sum=$(( sum + $(get_grains "$square")))
  done
  printf "%u\n" "$sum"

elif [[ "$1" -lt 1  || "$1" -gt 64  ]]; then

    echo "Error: invalid input"
    exit 1

else
get_grains "$INPUT"

fi

