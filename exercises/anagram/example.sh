#! /bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <string1> <string2>" >&2
  exit 1
fi

input="$1"
posibles="$2"

out=""

in_counts="$(echo $input | fold -w1 | sort | uniq -c)"
for posible in $posibles
do
    p_counts="$(echo $posible | fold -w1 | sort | uniq -c)"
    if test "$in_counts" = "$p_counts"
    then
        out="${posible} ${out}"
    fi
done

echo ${out% } #stip trailing spaces
