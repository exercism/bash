#!/usr/bin/env bash

main() {
    case $1 in
        privateKey) rand 2 $2 ;;
        publicKey|secret) "$@" ;;
        *) echo "unknown subcommand" >&2; exit 1 ;;
    esac
}

publicKey() {
    local -i p=$1 g=$2 private=$3
    powmod $g $private $p
}

secret() {
    local -i p=$1 public=$2 private=$3
    powmod $public $private $p
}

# function to do `pow(a, b) % c`
powmod() {
    local -i a=$1 b=$2 c=$3
    local -i result=1 i
    for ((i = 1; i <= b; i++)); do
        (( result *= a ))
        (( result > c )) && (( result %= c ))
    done
    echo $result
}


# a randomish number in the range [a,b)
rand() {
    local -i a=$1 b=$2
    local -i r=$(( RANDOM % (b - a) ))
    echo $(( r + a ))
}

main "$@"
