#!/usr/bin/env bash

# \034 is the ASCII FS (field separator) character
# It's unlikely to appear in the input text.
FS=$'\034'

result() { echo "$1"; exit 0; }

main() {
    local list1 list2
    list1=$( normalize "$1" )
    list2=$( normalize "$2" )

    case "$list1" in
        "$list2") result equal ;;
        "$FS$FS") result sublist ;;
      *"$list2"*) result superlist ;;
    esac
    case "$list2" in
        "$FS$FS") result superlist ;;
      *"$list1"*) result sublist ;;
    esac
    result unequal
}

normalize() {
    local list=$1
    list=${list//, /$FS}
    list=${list/#[/$FS}
    list=${list/%]/$FS}
    echo "$list"
}

main "$@"
