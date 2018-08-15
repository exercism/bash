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

coprime_check () { #check coprimality of a and m

  check=$((a % 2))

  if [ "$check" -ne 0 ]; then
    for (( factor=3; factor<="$a"; factor+=2 )); do
      if [[ $((a % factor)) -eq 0 && $((26 % factor)) -eq 0 ]]; then
        echo "a and m must be coprime." && exit 1
      fi
    done #wish I could find a cleaner solution for this function
  else
    echo "a and m must be coprime." && exit 1
  fi

}

a="$2"; b="$3"

for letter in {a..z}; do #generate the alphabet map
  alphabet+=("$letter")
done

for i in "${!alphabet[@]}"; do #generate encoded pair for 'tr'
  index=$((a * i + b))         #E(x) = (ax + b) mod m
  index=$((index % 26))
  cypherbet+="${alphabet[$index]}"
done

coprime_check

if [ -p /dev/stdin ]; then
  while IFS= read -r line; do
    process "$1" "$line"
  done
elif [ -f "./$4" ]; then
  while IFS= read -r line; do
    process "$1" "$line"
  done < "$4"
else
  process "$1" "$4"
fi

exit 0
