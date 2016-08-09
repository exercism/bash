#!/bin/bash

input=$1
input="${input#"${input%%[![:space:]]*}"}"   # remove leading whitespace characters
input="${input%"${input##*[![:space:]]}"}"   # remove trailing whitespace characters

# Is there silence?
if [ "$input" == "" ]; then
  echo "Fine. Be that way!"
  exit 0
fi

# remove inside space characters (to make later parsing easier)
input=${input// /}

# remove special characters and numbers (to make later parsing easier)
input=${input//[\(\)\%\^\!\*\&\$\#\@1-9]/}

# Is there shouting?
if [ ${input%%*[^[:upper:]\?]*} ]; then
  if [ ${input%%*[^[:upper:]\?]*} != "?" ]; then  # in case there is just number and '?'
    echo "Whoa, chill out!"
    exit 0
  fi
fi

# Is it a question?
if [ "${input: -1}" == "?" ]; then
  echo "Sure."
  exit 0
fi

# Is it a regular statement ?
echo "Whatever."
