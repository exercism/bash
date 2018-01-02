#!/usr/bin/env bash

add='+1000000000 second'
start="$@$add"

finish=$(date --date="$start" -u)

echo $finish
