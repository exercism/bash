#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
  person="you"
else
  person="$1"
fi

echo "One for $person, one for me."
