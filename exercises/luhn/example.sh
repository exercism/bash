#!/bin/bash

num=$(echo "$1" | sed 's/[\ ]//g')

if ! [[ $num =~ ^[0-9]+$ ]] || [[ $1 -eq "0" ]]; then
    exit 1
fi

shift 1

len=${#num}
is_odd=1
sum=0
for((t = len - 1; t >= 0; --t)) {
    digit=${num:$t:1}

    if [[ $is_odd -eq 1 ]]; then
        sum=$(( sum + $digit ))
    else
        sum=$(( $sum + ( $digit != 9 ? ( ( 2 * $digit ) % 9 ) : 9 ) ))
    fi

    is_odd=$(( ! $is_odd ))
}

exit $(( 0 != ( $sum % 10 ) ))
