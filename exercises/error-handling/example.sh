#!/usr/bin/env bash

set -eu

if test $# -gt 1
then
    echo "Usage: hello <greetee>"
    exit 1
else
    echo "Hello, ${1}"
fi
