#!/usr/bin/env bash

correct_pattern="^1?[2-9][0-9]{2}[2-9][0-9]{6}$"

function usage {
  echo "Usage: $0 <phone-number>"
  # echo "<phone-number>: [1]NXX-NXX-XXXX : N=[2-9], X=[0-9]"
}

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

input="$1"

# Remove everything but numbers
result=${input//[^0-9]/""}

# Error checking
if [[ ! $result =~ $correct_pattern ]]; then
  echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
  exit 1
fi

# Strip off leading 1 country code if exists
echo ${result: -10}