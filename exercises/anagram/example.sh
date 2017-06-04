#! /bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <string1> <string2>" >&2
  exit 1
fi

input="$1"
possibles="$2"

out=""

in_counts="$(echo $input | tr '[:upper:]' '[:lower:]' | fold -w1 | sort | uniq -c)"
for possible in $possibles
do
    p_counts="$(echo $possible | tr '[:upper:]' '[:lower:]' | fold -w1 | sort | uniq -c)"
    if test "$in_counts" = "$p_counts" -a "$(echo $input | tr '[:upper:]' '[:lower:]')" != "$(echo $possible | tr '[:upper:]' '[:lower:]')"
    then
        out="${out} ${possible}"
    fi
done

echo ${out# } #strip leading spaces
