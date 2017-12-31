#!/bin/bash

num=$(echo "$1" | sed 's/[\ ]//g')

if ! [[ 10#$num -ge 0 ]] 2>/dev/null || ! [[ ${#num} -gt 1 ]] ; then
    echo 1
else
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

    echo $(( 0 != ( $sum % 10 ) ))

fi
