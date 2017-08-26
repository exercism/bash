#!/bin/bash

input="$1";

if [ ! -n "${input}" ]
then
	echo "Usage: $0 <input>"
	exit;
fi

awk_progfile="${0%sh}awk";

if [ ! -f "${awk_progfile}" ]
then
	echo "Awk program file not found."
	exit 1;
fi

echo "$input" | tr '[:upper:]' '[:lower:]' | tr '.,:&@$%^!' ' ' | awk -f "${awk_progfile}";

exit $?;