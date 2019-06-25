#!/usr/bin/env bash 

shopt -u nocasematch

main() {
    local key OPTIND OPTARG

    while getopts :k: opt; do
        case $opt in
            k) key=$OPTARG ;;
            ?) echo "unknown option: -$OPTARG" >&2 ;;
        esac
    done
    shift $((OPTIND - 1))

    [[ -z $key ]] && key=$(generate_key)
    validate_key "$key"

    case $1 in
        encode|decode) "$1" "$2" "$key" ;;
        key) echo "$key" ;;
        *)   echo "unknown subcommand: $OPTARG" >&2 ;;
    esac
}

# ord: the ascii value of a character
# $ ord "A" #=> 65
#
# Note the leading single quote in the last argument 
# https://www.gnu.org/software/bash/manual/bash.html#index-printf
#     Arguments to non-string format specifiers (ed: such as %d)
#     are treated as C language constants, except [...] if
#     the leading character is a single or double quote, the
#     value is the ASCII value of the following character.

ord() {
    printf "%d" "'$1"
}

# chr: the character represented by the given ASCII decimal value
# $ chr 65 #=> A
#
# Would probably be more performant to use a fixed array of
# letters and index into it, but this is pretty cool.

chr() {
    printf "\x$(printf "%x" "$1")"
}

# 100 random lower case letters
generate_key() {
    local key=""
    local -i a=$(ord "a") i idx
    for i in {1..100}; do
        idx=$(( RANDOM % 26 ))
        key+=$(chr $((a + idx)))
    done
    echo "$key"
}

# the key must contain only lowercase letters
validate_key() {
    local key=$1
    if [[ $key == *[^a-z]* ]]; then
        echo "invalid key: contains non-lc-letter" >&2
        exit 1
    fi
}

encode() { _code "$1" "$2"  1; }

decode() { _code "$1" "$2" -1; }

_code() {
    local -l plaintext=$1 key=$2        # lower case
    local -i direction=$3
    local -i a=$(ord "a") i idx p k
    local encoded=""

    # ensure the key is long enough
    while [[ ${#key} -lt ${#plaintext} ]]; do key+=$key; done

    for (( i = 0; i < ${#plaintext}; i++ )); do
        p=$(( $(ord "${plaintext:i:1}") - a ))
        k=$(( $(ord "${key:i:1}")       - a ))

        # (-5 % 26) == -5, but we want to normalize it
        # to be between 0 and 25
        idx=$(( (((p + k * direction) % 26) + 26) % 26 ))
        encoded+=$(chr $((a + idx)))
    done
    echo "$encoded"
}

main "$@"
