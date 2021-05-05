#!/bin/bash

num=${1// /}

if [[ $num =~ [^[:digit:]] ]] || [[ ${#num} -le 1 ]] ; then
    echo "false"
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

    if [[ 0 -eq $(( 0 != ( $sum % 10 ) )) ]] ; then
        echo "true"
    else
        echo "false"
    fi

fi
