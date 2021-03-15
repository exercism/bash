#!/usr/bin/env bash

bash_version=$((10 * BASH_VERSINFO[0] + BASH_VERSINFO[1]))
if (( bash_version < 43 )); then
    echo "This library requires at least bash version 4.3" >&2
    return 4
fi

# Due to inherent bash limitations around word splitting and globbing,
# functions that are intended to *return a list* are instead required to
# receive a nameref parameter, the name of an array variable that will be
# populated in the list function.
# See the filter, map and reverse functions.

# Also note that nameref parameters cannot have the same name as the
# name of the variable in the calling scope.


# Append some elements to the given list.
list::append () {
    local -n __list1=$1
    shift
    __list1+=( "$@" )
}

# Return only the list elements that pass the given function.
list::filter () {
    local funcname=$1
    local -n __list=$2
    local -n __result=$3

    for element in "${__list[@]}"; do
        $funcname "$element" && __result+=("$element")
    done
}

# Transform the list elements, using the given function,
# into a new list.
list::map () {
    local funcname=$1
    local -n __list=$2
    local -n __result=$3

    for element in "${__list[@]}"; do
        __result+=( "$($funcname "$element")" )
    done
}

# Left-fold the list using the function and the initial value.
list::foldl () {
    local funcname=$1 acc=$2
    local -n __list=$3

    for element in "${__list[@]}"; do
        acc=$( $funcname "$acc" "$element" )
    done
    echo "$acc"
}

# Right-fold the list using the function and the initial value.
list::foldr () {
    local funcname=$1 acc=$2
    local -n __list=$3

    for (( i = ${#__list[@]} - 1; i >=0; i-- )); do
        acc=$( $funcname "${__list[i]}" "$acc" )
    done
    echo "$acc"
}

# Return the list reversed
list::reverse () {
    local -n __list=$1
    local -n __result=$2
    local -i size=${#__list[@]}
    for (( i = 0; i < size; i++ )); do
        __result[i]=${__list[-1 - i]}
    done
}
