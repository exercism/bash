#!/usr/bin/env bash

encode () {
	clean_string=$(echo "$1" | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]')
	converted_string=$(tr abcdefghijklmnopqrstuvwxyz zyxwvutsrqponmlkjihgfedcba <<< "$clean_string")
	echo "$converted_string" | sed 's/.\{5\}/& /g' | awk '{$1=$1};1'
}

decode () {
	clean_string=$(tr -d '[:space:]' <<< "$1")
	echo "$clean_string" | tr zyxwvutsrqponmlkjihgfedcba abcdefghijklmnopqrstuvwxyz
}

"$@"
