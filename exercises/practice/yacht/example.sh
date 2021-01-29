#!/usr/bin/env bash

# assume proper rolls 1<=d<=6

main() {
    local category=$1; shift

    case $category in
        ones)   xs 1 $@ ;;
        twos)   xs 2 $@ ;;
        threes) xs 3 $@ ;;
        fours)  xs 4 $@ ;;
        fives)  xs 5 $@ ;;
        sixes)  xs 6 $@ ;;
        "full house")      full_house $@ ;;
        "four of a kind")  four_of_a_kind $@ ;;
        "little straight") straight 1 $@ ;;
        "big straight")    straight 2 $@ ;;
        yacht)             yacht $@ ;;
        choice)            sum $@ ;;
    esac
}

xs() {
    local -i target=$1; shift
    local -i count=0 die
    for die; do
        (( die == target )) && (( count += 1 ))
    done
    echo $(( target * count ))
}

sum() {
    local -i sum=0 die
    for die; do
        (( sum += die ))
    done
    echo $sum
}


# the first parameter is an "inout" array nameref
group() {
    local -n ary=$1; shift
    ary=()
    local -i die
    for die; do
        (( ary[die] += 1 ))
    done
}

yacht() {
    local -a grp
    group grp $@
    # if the size of the array is 1, then all dice the same
    (( ${#grp[@]} == 1 )) && echo 50 || echo 0
}

full_house() {
    local -a grp
    group grp $@
    if (( ${#grp[@]} != 2 )); then
        echo 0
    else
        local -i die
        for die in ${!grp[@]}; do
            case ${grp[die]} in
                2|3) sum $@ ;;
                *) echo 0 ;;
            esac
            return
        done
    fi
}

four_of_a_kind() {
    local -a grp
    local -i die
    group grp $@
    for die in ${!grp[@]}; do
        if [[ ${grp[die]} == [45] ]]; then
            echo $(( die * 4 ))
            return
        fi
    done
    echo 0
}

straight() {
    local -i start=$1; shift
    local -i cmp
    (( start == 1 )) && cmp=12345 || cmp=23456

    # calling out to sort, might as well use paste
    local dice=$(printf "%d\n" "$@" | sort -n | paste -sd "")

    (( dice == cmp )) && echo 30 || echo 0
}


main "$@"
