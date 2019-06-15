#!/usr/bin/env bash

main() {
    case $1 in
        "+") add $2 $3 ;;
        "-") sub $2 $3 ;;
        "*") mul $2 $3 ;;
        "/") div $2 $3 ;;
        abs) abs $2 ;;
        pow) pow $2 $3 ;;
        rpow) rpow $2 $3 ;;
        reduce) reduce $2 ;;
    esac
}

add() {
    local -A r1 r2
    parse $1 r1
    parse $2 r2
    local n1=${r1[numerator]} d1=${r1[denominator]}
    local n2=${r2[numerator]} d2=${r2[denominator]}

    local n=$(( n1 * d2 + n2 * d1 ))
    local d=$(( d1 * d2 ))

    reduced $n $d
}

sub() {
    local -A r2
    parse $2 r2
    (( r2[numerator] *= -1 ))
    add $1 $(reduced "${r2[@]}")
}

mul() {
    local -A r1 r2
    parse $1 r1
    parse $2 r2
    local n1=${r1[numerator]} d1=${r1[denominator]}
    local n2=${r2[numerator]} d2=${r2[denominator]}

    local n=$(( n1 * n2 ))
    local d=$(( d1 * d2 ))

    reduced $n $d
}

div() {
    local -A r2
    parse $2 r2
    mul $1 $(reduced ${r2[denominator]} ${r2[numerator]})
}

abs() {
    local -A r1
    parse $1 r1
    reduced $(_abs ${r1[numerator]}) $(_abs ${r1[denominator]})
}

# this is rational ^ real => 1/2 ^ 3 == 1/8
pow() {
    local power=$2
    local n d
    local -A r
    parse $1 r
    if (( power >= 0 )); then
        n=$(( r[numerator] ** power ))
        d=$(( r[denominator] ** power ))
    else
        n=$(( r[denominator] ** (-1 * power) ))
        d=$(( r[numerator] ** (-1 * power) ))
    fi
    reduced $n $d
}

# this is real ^ rational => 3 ^ 1/2 == sqrt(3)
# bail out to an external tool
rpow() {
    local -i base=$1
    local -A r
    parse $2 r
    awk -v a=$1 \
        -v b=${r[numerator]} \
        -v c=${r[denominator]} \
        'BEGIN {
                ans = sprintf("%.6f", a ** (b / c))
                sub(/0+$/, "0", ans)
                print ans
        }'
}

reduce() {
    local -A r1
    parse $1 r1
    reduced ${r1[numerator]} ${r1[denominator]}
}

parse() {
    local -n ary=$2
    IFS=/ read ary[numerator] ary[denominator] <<<"$1"
}

reduced() {
    local -i numer=$1 denom=$2
    if (( numer == 0 )); then
        echo "0/1"
        return
    fi

    local -i gcd=$( gcd $numer $denom )
    (( numer /= gcd ))
    (( denom /= gcd ))
    if (( denom < 0 )); then
        (( numer *= -1 ))
        (( denom *= -1 ))
    fi
    printf "%d/%d" $numer $denom
}

_abs() {
    (( $1 < 0 )) && echo $(( $1 * -1 )) || echo $1
}

gcd() {
    local -i a=$(_abs $1) b=$(_abs $2)
    if (( b > 0 )); then
        gcd $b $((a % b))
    else
        echo $a
    fi
}

main "$@"
