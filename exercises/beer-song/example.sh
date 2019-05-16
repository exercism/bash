#!/bin/bash


main() {
    case $# in
        1)  verse "$1" ;;
        2)  if (( $1 < $2 )); then
                echo "error: start cannot be less than end" >&2
                exit 1
            fi
            for (( i="$1"; i>="$2"; i-- )); do
                verse $i
                echo ""
            done
            ;;
        *)  echo "usage: ${0##*/} verse_num" >&2
            echo "   or: ${0##*/} start end" >&2
            exit 2
            ;;
    esac
}

verse() {
    local n=$1
    local b=$(bottles $n)
    local w="on the wall"
    printf "%s %s, %s.\n" "$(capitalize "$b")" "$w" "$b"
    b=$(bottles $((n-1)))
    printf "%s, %s %s.\n" "$(action $n)" "$b" "$w"
}

bottles() {
    local n=$1
    (( n < 0 )) && n=99
    local num s
    (( n == 0 )) && num="no more" || num=$n
    (( n == 1 )) && s="" || s="s"
    printf "%s bottle%s of beer" "$num" "$s"
}

capitalize() {
    local str=$1
    local -u first=${str:0:1}
    printf "%s%s" "$first" "${str:1}"
}

action() {
    local n=$1
    if (( n == 0 )); then
        echo "Go to the store and buy some more"
    else
        local one
        (( n == 1 )) && one="it" || one="one"
        echo "Take $one down and pass it around"
    fi
}
        
main "$@"
