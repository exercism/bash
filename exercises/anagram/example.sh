#! /bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <string1> <string2>" >&2
  exit 1
fi

input="$1"
posibles="$2"

out=""

in_counts="$(echo $input | tr '[:upper:]' '[:lower:]' | fold -w1 | sort | uniq -c)"
for posible in $posibles
do
    p_counts="$(echo $posible | tr '[:upper:]' '[:lower:]' | fold -w1 | sort | uniq -c)"
    if test "$in_counts" = "$p_counts" -a "$(echo $input | tr '[:upper:]' '[:lower:]')" != "$(echo $posible | tr '[:upper:]' '[:lower:]')"
    then
        out="${out} ${posible}"
    fi
done

echo ${out# } #stip leading spaces
