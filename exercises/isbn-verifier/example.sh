#!/usr/bin/env bash
#
# This checks the valididty of input as an isbn-10
###
readonly input="${1:-'none'}" # lets set these constants
readonly isbn_candidate="${input//-/}"

# must be 10 digits
[[ ${#isbn_candidate} -ne 10 ]] && printf "%s\n" "false" && exit 0

number="${isbn_candidate:0:9}" last="${isbn_candidate: -1:1}"

[[ $last == 'X' ]] && last=10 # set the check digit if 'X'

# verify that invalid chracters were not in the input
[[ $number != ${number//[![:digit:]]/} || $last != *[0-9]* ]] && \
printf "%s\n" "false" && exit 0

declare -i n=10 sum=0

while read -r -n1 digit; do # process all but the check digit
  (( sum += digit * n )) && (( n-- ))
done <<< "$number"

(( sum += last )) # process the check digit

# true if divisible by 11
[[ $(( sum % 11 )) -eq 0 ]] && printf "%s\n" "true" && exit 0

printf "%s\n" "false"
