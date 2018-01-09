#!/usr/bin/env bash

input="$1"

if [[ ! -n "${input}" ]]
then
	echo "Usage: $0 <input>"
	exit
fi

echo "$input" \
  | tr '[:upper:]' '[:lower:]' \
  | tr '.,:&@$%^!' ' ' \
  | awk -f <(cat - <<-'HEREDOC'
      {
        for (field_index = 1; field_index <= NF; field_index++)
        {
          result[$field_index]++
        }
      }
      END {
        for (field_index in result)
        {
          printf "%s: %d\n", field_index, result[field_index]
        }
      }
HEREDOC
)

exit $?
