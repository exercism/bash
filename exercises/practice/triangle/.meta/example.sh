#!/usr/bin/env bash

set -o errexit   # Stop script on command error
set -o nounset   # Error out if accessing undefined variable name
set -o pipefail  # Error out if any step in a pipe errors out

if [[ $# -ne 4 ]]; then
  echo "Usage: $0 [equilateral | isosceles | scalene] <s1> <s2> <s3>"
  exit 2 # Improper inputs
fi

triangle_type=$1
s1=$2
s2=$3
s3=$4

assert() {
  # Takes a numerical inequality in a string.
  # Pipes it through to bc
  # Float-proof numeric comparison :
  [[ $( echo $1 | bc -l ) -eq 1 ]]
}

output() {
  exit_code=$1

  if [ $exit_code -eq 0 ]; then
    echo "true"
  else
    echo "false"
  fi

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

if ! valid_triangle $s1 $s2 $s3; then
  # Sides do not meet triangle inequality requirement
  # Given a <= b <= c and a, b, c != 0, a + b >= c
  output 1
fi

equilateral() {
  assert "$1 == $2" && assert "$1 == $3"

  output $?
}

isosceles() {
  assert "$1 == $2" || assert "$1 == $3" || assert "$2 == $3"

  output $?
}

scalene() {
  assert "$1 != $2" && assert "$1 != $3" && assert "$2 != $3"

  output $?
}

# Bash Ternary Operator:
# (boolean value/calculation) && action if true || action if false
# Works because of boolean shortcutting.
# If boolean clause is false, it doesn't evaluate the other side of &&
# If first thing is false, it evaluates the item after ||,
# but if first two are true, doesn't bother evaluating last part.
$triangle_type $s1 $s2 $s3 && exit 0 || exit 1
