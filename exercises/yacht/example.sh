#!/usr/bin/env bash

set -o errexit
set -o nounset

as_lines() {
  printf "%s\n%s\n%s\n%s\n%s\n" "$1" "$2" "$3" "$4" "$5"
}

as_string() {
  printf "%s%s%s%s%s\n" "$1" "$2" "$3" "$4" "$5"
}

count_map() {
  declare -A counts
  while read x ; do
    prev=${counts[$x]:-0}
    counts["$x"]=$(( prev + 1 ))
  done
  for (( i=1; i <= 6; i++)) ; do
    printf "%s\t%s\n" "$i" "${counts[$i]:-0}"
  done
}

_grep() {
  while read x ; do
    if [[ $x == *$1* ]]; then
      printf "%s\n" "$x"
    fi
  done
}

_sum() {
  sum=0
  while read x ; do
    sum=$((sum + x))
  done
  echo "$sum"
}

mode="$1"
shift

case "$mode" in
  ones)
    as_lines "$@" | _grep 1 | _sum ;;
  twos)
    as_lines "$@" | _grep 2 | _sum ;;
  threes)
    as_lines "$@" | _grep 3 | _sum ;;
  fours)
    as_lines "$@" | _grep 4 | _sum ;;
  fives)
    as_lines "$@" | _grep 5 | _sum ;;
  sixes)
    as_lines "$@" | _grep 6 | _sum ;;

  "little straight")
    if [ -n "$( as_string "$@" | _grep 1 | _grep 2 | _grep 3 | _grep 4 | _grep 5 )" ]; then
           printf "30\n"
         else
      printf "0\n"
    fi
    ;;    
  "big straight")
    if [ -n "$( as_string "$@" |  _grep 2 | _grep 3 | _grep 4 | _grep 5 | _grep 6)" ]; then
           printf "30\n"
         else
      printf "0\n"
    fi
    ;;    

  choice)
    as_lines "$@" | _sum
    ;;

  "full house")
    COUNT_MAP="$(as_lines "$@" | count_map)"
    if [ -n "$(_grep $'\t2' <<<"$COUNT_MAP")" ] && [ -n "$(_grep $'\t3' <<<"$COUNT_MAP")" ]; then
      as_lines "$@" | _sum
    else
      printf "0\n"
    fi
    ;;

  "four of a kind")
    COUNT_MAP="$(as_lines "$@" | count_map)"
    WITH_FOURS="$(_grep $'\t4' <<<"$COUNT_MAP")"
    WITH_FIVES="$(_grep $'\t5' <<<"$COUNT_MAP")"

    if [ -z "$WITH_FOURS" ] && [ -z "$WITH_FIVES" ]; then
      printf "0\n"
    else
      printf "%s\n%s\n" "$WITH_FOURS" "$WITH_FIVES" |
        while read face_value count ; do
          sum="$((4 * face_value))"
          if [ "$sum" -gt 0 ]; then
            printf "%s\n" "$sum"
          fi
        done
    fi
    ;;
  "yacht")
    COUNT_MAP="$(as_lines "$@" | count_map)"

    if [ -n "$(_grep $'\t5' <<<"$COUNT_MAP")" ]; then
      printf "50\n"
    else
      printf "0\n"
    fi
    ;;

esac
