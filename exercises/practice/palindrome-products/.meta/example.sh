#!/usr/bin/env bash

# algorithm lifted from
# https://exercism.io/tracks/python/exercises/palindrome-products/solutions/d68cab86cad94d4d821f26da44bb0722

main() {
    local which=$1
    local -i min=$2 max=$3

    (( min > max )) && die "min must be <= max"

    local -i step
    local -i start end
    case $which in
        smallest)
            step=1
            start=$((min ** 2))
            end=$((max ** 2))
            ;;
        largest)
            step=-1
            start=$((max ** 2))
            end=$((min ** 2))
            ;;
        *) die "first arg should be 'smallest' or 'largest'" ;;
    esac        

    local -i i=$start
    while ((step == 1 && i <= end)) || ((step == -1 && i >= end)); do
        if is_palindrome "$i"; then
            local factors=$(factors $i $min $max $step)
            if [[ -n $factors ]]; then
                printf "%d:%s\n" $i "$factors"
                break
            fi
        fi
        (( i += step ))
    done
}

factors() {
    local -i n=$1 min=$2 max=$3 step=$4 i j start
    local factors="" cond
    case $step in
        1) start=min; cond="<=" ;;
        *) start=max; cond=">=" ;;
    esac
    for ((i=start; i*i $cond n; i+=step)); do
        j=$(( n / i ))
        if (( i * j == n && (min <= j && j <= max) )); then
            case $step in      
                1) factors+=" [$i, $j]" ;;
                *) factors+=" [$j, $i]" ;;
            esac
        fi
    done
    echo "$factors" 
}       

die() {
    echo "$*" >&2
    exit 1
}

is_palindrome() {
    local word=$1
    local -i i j len=${#word}
    for ((i = len / 2; i >= 0; i--)); do
        j=$(( len - i - 1 ))
        [[ ${word:i:1} == "${word:j:1}" ]] || return 1
    done
}

main "$@"
