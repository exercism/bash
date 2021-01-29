#!/usr/bin/env bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    echo "This library of functions should be sourced into another script" >&2
    exit 4
fi
if (( BASH_VERSINFO[0] < 4 )); then
    echo "This library requires at least bash version 4" >&2
    return 4
fi

# Due to inherent bash limitations around word splitting and globbing,
# functions that are intended to *return a list* are instead required to
# receive an nameref parameter, the name of an array variable that will be
# populated in the list function.
# See the filter, map and reverse functions.

# Also note that nameref parameters cannot have the same name as the
# name of the variable in the calling scope.


# Append some elements to the given list.
list::append () {
    echo "Implement me" >&2
    return 1
}

# Return only the list elements that pass the given function.
list::filter () {
    echo "Implement me" >&2
    return 1
}

# Transform the list elements, using the given function,
# into a new list.
list::map () {
    echo "Implement me" >&2
    return 1
}

# Left-fold the list using the function and the initial value.
list::foldl () {
    echo "Implement me" >&2
    return 1
}

# Right-fold the list using the function and the initial value.
list::foldr () {
    echo "Implement me" >&2
    return 1
}

# Return the list reversed
list::reverse () {
    echo "Implement me" >&2
    return 1
}
