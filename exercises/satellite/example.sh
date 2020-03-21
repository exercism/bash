#!/usr/bin/env bash

buildTree() {
    local -a preorder inorder
    
    # read the space-separated items into an array
    read -ra preorder <<< "$1"
    read -ra inorder  <<< "$2"

    validate preorder inorder

    if (( ${#preorder[@]} == 0 )); then
        echo "{}"
        return
    fi

    local root=${preorder[0]}
    local idx
    idx=$( indexOf "$root" "${inorder[@]}" )
    (( idx == -1 )) && die "should not happen"

    local leftInorder=(  "${inorder[@]: 0 : $idx}" )
    local rightInorder=( "${inorder[@]: $idx+1}" )

    local leftPreorder=(  "${preorder[@]: 1 : $idx}" )
    local rightPreorder=( "${preorder[@]: $idx+1}" )

    # I hate hardcoding the name of a recursive function
    local func=${FUNCNAME[0]}

    printf '{"v": "%s", "l": %s, "r": %s}' \
        "$root" \
        "$( "$func" "${leftPreorder[*]}" "${leftInorder[*]}" )" \
        "$( "$func" "${rightPreorder[*]}" "${rightInorder[*]}" )"
}

validate() {
    local -n _preorder=$1  _inorder=$2

    if (( ${#_preorder[@]} != ${#_inorder[@]} )); then
        die "Traversals must have the same length"
    fi

    local -A seen

    for elem in "${_preorder[@]}"; do
        if [[ ${seen["$elem"]} ]]; then
            die "Traversals must contain unique elements"
        fi
        seen["$elem"]=1
        if (( $(indexOf "$elem" "${_inorder[@]}") == -1 )); then
            die "Traversals must have the same elements"
        fi
    done
}

indexOf() {
    local needle=$1
    local haystack=( "${@:2}" )
    local i

    for (( i=0; i < ${#haystack[@]}; i++ )); do
        if [[ $needle == "${haystack[i]}" ]]; then
            echo "$i"
            return
        fi
    done

    echo "-1"   # not found
}

die() { echo "$*" >&2; exit 1; }

buildTree "$@"
