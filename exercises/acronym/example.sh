#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo 'Usage: $0 "<phrase1>"' >&2
  exit 1
fi

phrase=$(echo "$1" | tr '-' ' ')
set -f -- junk $phrase
shift
for word; do
    initial="$(echo "$word" | head -c 1 | tr '[:lower:]' '[:upper:]')"
    acronym+=$initial
done
echo "$acronym"

exit 0
