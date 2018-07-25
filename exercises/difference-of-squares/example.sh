#!/usr/bin/env bash

n="$2"

sum_of_squares () {
  for ((i=1; i<=n; i++)); do
    squares_summed=$((squares_summed + i ** 2))
  done
  echo $squares_summed
}

square_of_sum () {
  for ((i=1; i<=n; i++)); do
    sum=$((sum + i))
  done
  square=$((sum ** 2))
  echo $square
}

difference_of_squares () {
  echo $(($(square_of_sum) - $(sum_of_squares)))
}

"$@"
