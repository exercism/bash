#!/usr/bin/env bash

set -o errexit
set -o nounset

if [ $# -ne 1 ]; then
  echo "Usage: ./error_handling <greetee>"
  exit 1
else
  echo "Hello, ${1}"
  exit 0
fi
