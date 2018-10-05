#!/usr/bin/env bash

# This is a bash script template in order to help you quick start any script.
# It contains some sensible defaults, you can learn more by visiting:
# https://google.github.io/styleguide/shell.xml

# This option will make the script exit when there is an error
set -o errexit
# This option will make the script exit when are unset variables
set -o nounset

main() {
  category="$1"

  dice1="$2"
  dice2="$3"
  dice3="$4"
  dice4="$5"
  dice5="$6"

  # Add your code here
}

# Calls the main function passing all the arguments to it via '$@'
# The argument is in quotes to prevent whitespace issues
main "$@"
