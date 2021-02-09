#!/usr/bin/env bash

input="${1}Z +1000000000 second"
format="%Y-%m-%dT%H:%M:%S"

date --utc --date="$input" "+$format"
