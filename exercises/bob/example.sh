#!/bin/bash

# Get what Bob says.
# %b interprets escapted characters (like '\n' for newline)
input="$(printf %b "${1}")"

# Remove space characters
input="${input//[[:space:]]/}"
input="${input//$(printf '\u00a0')}"  # [[:space:]] doesn't match \u00a0 on Linux

# Is there silence?
if [[ "${input}" == "" ]]; then
  echo "Fine. Be that way!"
  exit 0
fi

# Is there shouting (capital letter and no lowercase letters)
if [[ "$input" == *[[:upper:]]* ]] && [[ "$input" != *[[:lower:]]* ]]; then
  echo "Whoa, chill out!"
  exit 0
fi

# Is it a question? (last character is a '?')
if [[ "${input: -1}" == "?" ]]; then
  echo "Sure."
  exit 0
fi

# Is it a regular statement ?
echo "Whatever."
