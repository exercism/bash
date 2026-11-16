#!/usr/bin/env bash
#

if (( "$#" != 1 )); then
  echo "Usage: $0 '<phrase1>'" >&2
  exit 1
fi

read -ra words < <(tr -s '*-' ' ' <<< "$1")

shopt -s extglob
for word in "${words[@]}"; do
    initial="$(echo "${word##+(_)}" | head -c 1 | tr '[:lower:]' '[:upper:]')"
    acronym+=$initial
done
echo "$acronym"

exit 0
