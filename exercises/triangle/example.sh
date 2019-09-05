#!/usr/bin/env bash

set -o errexit   # Stop script on command error
#set -o nounset   # Error out if accessing undefined variable name
set -o pipefail  # Error out if any step in a pipe errors out

usage () {
  echo "Usage: $0 [equilateral | isosceles | scalene] <s1> <s2> <s3>"
  exit 2 # Improper inputs
}

assert() {
  # Takes a numerical inequality in a string.
  # Pipes it through to bc
  # Float-proof numeric comparison :
  [[ $( echo $1 | bc -l ) -eq 1 ]]
}

output() {
  [[ $1 -eq 0 ]] && echo 'true' || echo 'false'
  exit 0
}

valid_triangle() {
  # Takes three sides lengths (numeric) $1, $2, $3
  # If any side is zero, returns false
  assert "$1 == 0" || assert "$2 == 0" || assert "$3 == 0" && return 1
  # If triangle doesn't meet inequality requirement, returns false
  assert "$1 + $2 <= $3" || assert "$1 + $3 <= $2" || assert "$2 + $3 <= $1" && return 1

  return 0
}

validate_args () {
  [[ $# -eq 3 ]] || usage
  valid_triangle "$@"
}

equilateral() {
  validate_args "$@" || output 1
  assert "$1 == $2" && assert "$1 == $3"

  output $?
}

isosceles() {
  validate_args "$@" || output 1
  assert "$1 == $2" || assert "$1 == $3" || assert "$2 == $3"

  output $?
}

scalene() {
  validate_args "$@" || output 1
  assert "$1 != $2" && assert "$1 != $3" && assert "$2 != $3"

  output $?
}
