#!/usr/bin/env bash

# external tools used: gawk

main() {
    local -g year=$1 month=$2   # global
    local nth=$3 weekday=$4
    local -i n=0

    # `month_days` outputs: "weekday day month" for 31 days
    # starting from the first of the given year-month.
    # For months like February, day 31 might be in 
    # a different month.

    month_days | {
        while read -r wd d m; do
            (( month == m )) || continue
            [[ $weekday == "$wd" ]] || continue
            (( n++ ))
            day=$d      # remember this value
            case "$nth" in
                first ) (( n == 1 )) && break ;;
                second) (( n == 2 )) && break ;;
                third ) (( n == 3 )) && break ;;
                fourth) (( n == 4 )) && break ;;
                teenth) (( 13 <= d && d <= 19 )) && break ;;
            esac
        done
        result "$day"   # last
    }
}

result() {
    printf "%d-%02d-%02d" "$year" "$month" "$1"
    # Read the rest of the input from `month_days` so the pipe can be closed gracefully.
    cat - > /dev/null
}

month_days() {
    # Generate the days of the month.
    local i
    for i in {0..30}; do
        date -d "$year/$month/1 + $i days" '+%A %_d %_m'
    done
}

main "$@"
