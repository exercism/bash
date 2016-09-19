#!/bin/bash

# Exit on error. Append || true if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch error even if it's not in after the last pipe.
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

# Set magic variables for current file, directory, os, etc.
#__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
#__base="$(basename ${__file} .sh)"

# print argument and exit
function say() {
  local mesg=${1}
  echo ${mesg}
  exit 0
}

if [[ $# -eq 0 ]]; then
  say "Fine. Be that way!"
fi

# Get what Bob says.
# %b interprets escapted characters (like '\n' for newline)
input="$(printf %b "${1}")"

# Remove space characters
input="${input//[[:space:]]/}"
input="${input//$(printf '\u00a0')}" # [[:space:]] doesn't match \u00a0 on Linux

# Is there silence?
if [[ "${input}" == "" ]]; then
  say "Fine. Be that way!"
fi

# Is there shouting (capital letter and no lowercase letters)
if [[ "$input" == *[[:upper:]]* ]] && [[ "$input" != *[[:lower:]]* ]]; then
  say "Whoa, chill out!"
fi

# Is it a question? (last character is a '?')
if [[ "${input: -1}" == "?" ]]; then
  say "Sure."
fi

# Is it a regular statement ?
echo "Whatever."
