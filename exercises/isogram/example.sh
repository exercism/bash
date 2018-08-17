#!/usr/bin/env bash

LOWERCASE_INPUT="${1,,}"

isogram_candidate="${LOWERCASE_INPUT//[![:lower:]]}"

for letter in {a..z}; do # remove each letter only once
  isogram_candidate="${isogram_candidate/$letter/}"
done

[[ -z $isogram_candidate ]] && echo 'true' || echo 'false'
