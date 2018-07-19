#!/bin/bash

# Bob answers 'Sure.' if you ask him a question.
# Bob answers 'Whoa, chill out!' if you yell at him.
# Bob answers 'Calm down, I know what I'm doing!' if you yell a question at him.
# Bob answers 'Fine. Be that way!' if you don't really say anything.
# Bob answers 'Whatever.' to anything else.

string=$(echo "$1" | tr -d ' ')
case_check="${string^^}"
num_only_check="${string//[!0-9,?!@#$%^&*()_+<>:]/}"

if [ -z "$string" ] || [ $# == 0 ]; then
  # If you don't really say anything
  echo "Fine. Be that way!"
  exit 0
elif [ "$string" == "$num_only_check" ]; then
  # for a question with only numbers
  if [ "${string:${#string}-1:1}" == "?" ]; then
    echo "Sure."
    exit 0
  # Bob says whatever to numbers
  else
    echo "Whatever."
    exit 0
  fi
elif [ "$string" == "$case_check" ]; then
  # If you yell a question at him
  if [ "${string:${#string}-1:1}" == "?" ]; then
    echo "Calm down, I know what I'm doing!"
    exit 0
  # otherwise it is just yelling
  else
    echo "Whoa, chill out!"
    exit 0
  fi
# Bob is down for any questions that aren't yelled at him
elif [ "${string:${#string}-1:1}" == "?" ]; then
  echo "Sure."
  exit 0
# Bob says whatever to anything else
else
  echo "Whatever."
  exit 0
fi
