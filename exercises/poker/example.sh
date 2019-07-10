#!/usr/bin/bash

# external tools used: sort, grep, wc, uniq

declare -ri SUCCESS=0 FAILURE=1

main() {
    local -A value

    for hand in "$@"; do
        validate "$hand" || die "invalid hand"
        value[$hand]=$( evaluate "$hand" )
    done
    # Now that we've validated the contents of the hand,
    # we can be really relaxed about quoting.

    local -i max=-1
    for val in "${value[@]}"; do
        (( val > max )) && max=$val
    done

    for hand in "${!value[@]}"; do
        (( max == value[$hand] )) && echo "$hand" || true
    done
}

die() { echo "$*" >&2; exit $FAILURE; }

validate() {
    local card="1?[234567890JQKA][HCSD]"
    local re="^$card( $card){4}$"
    [[ $1 =~ $re ]]
}

# Assign a numeric value to this hand.
#
# This is trickier than first glance. We can say that
# a 5-of-a-kind hand has the "highest value", but two
# hands each with 5-of-a-kind need some way to break the tie.
# Even worse, consider two hands of the worst value (no
# straight, no flush, no pairs). We may have to compare
# all cards in each hand to determine which is the better
# hand.
#
# I assign each hand a "value" and a "ranking". For example:
# - the hand "AH AS AD AC AH" has the value 9 * 10^11 (5 of
#   a kind), and the ranking "14" (face value of Ace)
# - the hand "4H 4H 5C 6C JD" has the value 1 * 10^11 (one
#   pair) and the ranking "4110605" (starts with 4, and
#   other face values descending
#
# The hand value is so big so that the value and the ranking
# can be combined into a single integer value. Given these
# hands:
# a) JH 10H 9H 2S 2C
# b) JD 10D 8D 2C 2S
#
# The both have hand value 1 * 10^11 = 100000000000
# Ranking of hand (a) is "2111009"
# Ranking of hand (a) is "2111008"
# Evaluated value of (a) is 100002111009
# Evaluated value of (b) is 100002111008
# So it's a simple numeric comparison to determine the winner.

evaluate() {
    local cards=$1

    local -a values
    readarray -t values < <(
        for card in $cards; do  #unquoted
            cardvalue $card
        done | sort -nr
    )

    local -i tiebreaker hand_value
    if tiebreaker=$( is_5_of_a_kind ${values[@]} ); then
        hand_value=9
    elif tiebreaker=$( is_straight_flush "$cards" ${values[@]} ); then
        hand_value=8
    elif tiebreaker=$( is_4_of_a_kind ${values[@]} ); then
        hand_value=7
    elif tiebreaker=$( is_full_house ${values[@]} ); then
        hand_value=6
    elif tiebreaker=$( is_flush "$cards" ${values[@]} ); then
        hand_value=5
    elif tiebreaker=$( is_straight ${values[@]} ); then
        hand_value=4
    elif tiebreaker=$( is_3_of_a_kind ${values[@]} ); then
        hand_value=3
    elif tiebreaker=$( is_2_pairs ${values[@]} ); then
        hand_value=2
    elif tiebreaker=$( is_1_pair ${values[@]} ); then
        hand_value=1
    else
        hand_value=0
        tiebreaker=$(ranking ${values[@]})
    fi

    echo $(( hand_value * 10**11 + tiebreaker ))
}

cardvalue() {
    local face=${1%[HSCD]}
    case $face in
        A) echo 14 ;;
        K) echo 13 ;;
        Q) echo 12 ;;
        J) echo 11 ;;
        *) echo $face ;;
    esac
}

ranking() {
    local value
    printf -v value "%02d" "$@"
    echo $(( 10#$value ))
}

is_5_of_a_kind() { has_grouping "5" $@; }
is_4_of_a_kind() { has_grouping "4 1" $@; }
is_3_of_a_kind() { has_grouping "3 1 1" $@; }
is_full_house()  { has_grouping "3 2" $@; }
is_2_pairs()     { has_grouping "2 2 1" $@; }
is_1_pair()      { has_grouping "2 1 1 1" $@; }

is_flush() {
    local cards=$1; shift
    # this _could_ be done in pure bash
    local n=$(printf "%s\n" $cards | grep -o '.$' | sort -u | wc -l)
    if (( n == 1 )); then
        ranking $@
        return $SUCCESS
    fi
    return $FAILURE
}

is_straight() {
    if [[ "$*" == "14 5 4 3 2" ]]; then
        # 5-high straight
        ranking 5 4 3 2 1
        return $SUCCESS
    else
        v=$1
        for i in {2..5}; do
            (( v == ${!i} + 1 )) || return $FAILURE
            v=${!i}
        done
        ranking $@
        return $SUCCESS
    fi
}

is_straight_flush() {
    local cards=$1; shift
    is_flush "$cards" $@ >/dev/null && is_straight $@
}

has_grouping() {
    local groupings=$1
    shift
    local -a groups values
    while read g v; do
        groups+=($g)
        values+=($v)
    done < <(
        printf "%s\n" "$@" |
        sort -nr |
        uniq -c |
        sort -k1,1nr -k2,2nr
    )
    if [[ "${groups[*]}" = "$groupings" ]]; then
        ranking ${values[@]}
        return $SUCCESS
    fi
    return $FAILURE
}

main "$@"
