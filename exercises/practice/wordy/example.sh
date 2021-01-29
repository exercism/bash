#!/usr/bin/env bash

main() {
    local -l question=$1            # lower case
    question=${question#what is}    # remove prefix words
    question=${question%?}          # remove trailing "?"

    [[ -n $question ]] || die "syntax error"

    subst question
    evaluate question
}

subst() {
    local -n q=$1
    while [[ $q == *[[:alpha:]]* ]]; do
        prev=$q

        q=${q//plus/+}
        q=${q//minus/-}
        q=${q//multiplied by/*}
        q=${q//divided by/\/}

        if [[ $prev == "$q" ]]; then
            # we have letters, but did not match a valid op
            die "unknown operation"
        fi
    done
}

evaluate() {
    local -n q=$1
    while true; do
        read -r a op b rest <<<"$q"

        isInt "$a" || die "syntax error"

        if [[ -z $op ]]; then
            echo "$a"
            return
        fi

        isInt "$b" || die "syntax error"
        isOp "$op" || die "syntax error"

        if [[ -n $rest ]]; then
            q="$(( a $op b )) $rest"
        else
            q=$(( a $op b ))
        fi
    done
}

shopt -s extglob

isInt() { [[ $1 == ?(-)+([[:digit:]]) ]]; }
isOp()  { [[ $1 == [-+*/] ]]; }
die()   { echo "$*" >&2; exit 1; }

main "$@"
