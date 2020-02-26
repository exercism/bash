#!/usr/bin/env bash

if (( $# != 1 )); then
  echo "Usage: $0 <greetee>" >&2
  exit 1
fi

echo "Hello, $1"
