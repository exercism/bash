#!/bin/bash

is_valid () {
    sorted=$( printf '%s\n' $1 $2 $3 | sort -n )
    ineq=${sorted/$'\n'/+}
    ineq=${ineq/$'\n'/>}
    if (( $ineq )) || ( [ $1 -eq 0 ] && [ $2 -eq 0 ] && [ $3 -eq 0 ] )
    then
        return 1
    fi
}

is_equilateral () {
    if is_valid $1 $2 $3 -eq 1 || ! ( [ $1 -eq $2 ] && [ $2 -eq $3 ] )
    then
        echo 'false'
    else
        echo 'true'
    fi
}

is_isosceles () {
    if is_valid $1 $2 $3 -eq 1 || ! ( [ $1 -eq $2 ] || [ $2 -eq $3 ] || [ $1 -eq $3 ] )
    then
        echo 'false'
    else
        echo 'true'
    fi
}

is_scalene () {
    if is_valid $1 $2 $3 -eq 1 || ! ( [ $1 -ne $2 ] && [ $2 -ne $3 ] && [ $1 -ne $3 ] )
    then
        echo 'false'
    else
        echo 'true'
    fi
}

"$@"
