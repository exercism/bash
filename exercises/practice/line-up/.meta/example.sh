#!/usr/bin/env bash

ordinal() {
    case $1 in
        *11|*12|*13) echo "${1}th" ;;
        *1) echo "${1}st" ;;
        *2) echo "${1}nd" ;;
        *3) echo "${1}rd" ;;
        *) echo "${1}th" ;;
    esac
}

main() {
    printf "%s, you are the %s customer we serve today. Thank you!" "$1" "$(ordinal "$2")"
}

main "$@"
