#!/bin/bash

input=$1
input="${input#"${input%%[![:space:]]*}"}"   # remove leading whitespace characters
input="${input%"${input##*[![:space:]]}"}"   # remove trailing whitespace characters

# Is there silence?
if [ "$input" == "" ]; then
  echo "Fine. Be that way!"
  exit 0
fi

# clean string up(to make later parsing easier)
input=${input// /}  # remove inside space characters
input=${input//[1-9]/}  # remove numbers
input=${input//[\%\^\*\&\$\#\@\\\~]/}  # remove special characters
input=${input//[\[\]\(\)\{\}\⟨\⟩\:\'\"\`\-\_\.\,\;\!]/}  # remove punctuation signs (leave '?' it indicates a question)

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
