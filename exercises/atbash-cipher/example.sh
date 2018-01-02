#!/usr/bin/env bash

encode () {
	clean_string=$(echo "$1" | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]')
	converted_string=$(echo "$clean_string" | tr abcdefghijklmnopqrstuvwxyz zyxwvutsrqponmlkjihgfedcba)
	echo "$converted_string" | sed 's/.\{5\}/& /g' | awk '{$1=$1};1'
}

decode () {
	clean_string=$(echo "$1" | tr -d '[:space:]')
	echo $clean_string | tr zyxwvutsrqponmlkjihgfedcba abcdefghijklmnopqrstuvwxyz
}

"$@"
