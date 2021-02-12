#!/bin/bash

process () { #main encoding and decoding process

  input="${2,,}"; input="${input//[[:blank:][:punct:]]/}"

  case "$1" in

    encode)
      echo "$input" | tr 'a-z' "$cypherbet" | fold -w5 | paste -sd' '
      ;;
    decode)
      echo "$input" | tr "$cypherbet" 'a-z'
      ;;

  esac

}

abs() {
  echo $(( $1 < 0 ? -1 * $1 : $1 ))
}

gcd() {
  local a; a=$(abs "$1")
  local b; b=$(abs "$2")
  if (( b > 0 )); then
    gcd "$b" $((a % b))
  else
    echo "$a"
  fi
}

coprime_check () { #check coprimality of a and m
  local m=${#alphabet[@]}
  if (( $(gcd "$a" "$m") != 1 )); then
    echo "a and m must be coprime." && exit 1
  fi
}

main () {

  alphabet=({a..z})

  a="$2"
  b="$3"
  coprime_check

  for i in "${!alphabet[@]}"; do #generate encoded pair for 'tr'
    index=$((a * i + b))         #E(x) = (ax + b) mod m
    index=$((index % 26))
    cypherbet+="${alphabet[$index]}"
  done

  process "$1" "$4"

}

main "$@"
