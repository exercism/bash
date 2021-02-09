#!/usr/bin/env bash

main() {
    case $1 in
        encode|decode) "$1" "$2" ;;
        *) echo "unknown subcommand" >&2; exit 1 ;;
    esac
}

encode() {
    local phrase=$1
    [[ -z $phrase ]] && return
    local result=""
    local count=0 char=${phrase:0:1}
    for ((i=0; i < ${#phrase}; i++)); do
        if [[ ${phrase:i:1} == "$char" ]]; then
            ((count++))
        else
            result+="$(encode_sequence "$count" "$char")"
            char=${phrase:i:1}
            count=1
        fi
    done
    result+="$(encode_sequence "$count" "$char")"
    echo "$result"
}

encode_sequence() {
    local count=$1 char=$2
    ((count == 1)) && count=""
    echo "${count}${char}"
}

decode() {
    local phrase=$1
    local result=""
    local count char
    while [[ -n $phrase ]]; do
        if [[ $phrase =~ ([0-9]*)([^0-9]) ]]; then
            count=${BASH_REMATCH[1]}
            [[ -z $count ]] && count=1
            char=${BASH_REMATCH[2]}
            result+="$(str_repeat "$char" $count)"
            len=${#BASH_REMATCH[0]}
            phrase=${phrase:len}
        fi
    done
    echo "$result"
}

str_repeat() {
    local result="" char=$1 count=$2
    for ((i=1; i<=$count; i++)); do result+="$char"; done
    echo "$result"
}

main "$@"
