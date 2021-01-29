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
            ((n++))
            case $nth in
                first ) (( n == 1 )) && result $d ;;
                second) (( n == 2 )) && result $d ;;
                third ) (( n == 3 )) && result $d ;;
                fourth) (( n == 4 )) && result $d ;;
                teenth) (( 13 <= d && d <= 19 )) && result $d ;;
            esac
            day=$d      # remember this value
        done
        result $day     # last
    }
}

result() {
    printf "%d-%02d-%02d" "$year" "$month" "$1"
    exit
}

month_days() {
    # Using perl to generate the days of the month.
    # perl should be fairly portable amongst *nix-ish systems.
    # Use the "C" locale for day names "Monday", ...
    # One invocation of perl will be more efficient than
    # thirty-ish invocations of date.

    LC_ALL=C perl -sE '
        use Time::Piece;
        use Time::Seconds;
        my $date = Time::Piece->strptime("$year-$month-01", "%Y-%m-%d");
        for my $i (1 .. 31) {
            # use "%_d" instead of "%d" because bash
            # arithmetic will puke on day 08 and 09
            say $date->strftime("%A %_d %_m");
            $date += ONE_DAY;
        }
    ' -- -year="$year" -month="$month"
}

main "$@"
