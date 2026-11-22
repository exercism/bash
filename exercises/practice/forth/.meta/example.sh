#!/usr/bin/env bash

set -f                  # disable path exansion
shopt -s extglob        # enable extended patterns

# I'm going to use the stack and the macros as
# global variables: Not best practice.
declare -a stack        # indexed array
declare -A macros       # associative array

# Encapsulate some stack operations
stack::len()  { echo ${#stack[@]}; }
stack::tail() { echo "${stack[-1]}"; }
stack::pop()  { stack=( "${stack[@]:0:$(stack::len)-1}" ); }
stack::push() { stack+=( "$@" ); }

# True if the first argument consists of only
# an optional sign and digits
is_number() { [[ $1 == ?([+-])+([0-9]) ]]; }

die() { echo "$*" >&2; exit 1; }

#
# The main function
#
main() {
    local -a words
    # Read from stdin
    while IFS= read -r line; do

        # Lower-case the line, and allow word-splitting.
        # Use the positional parameters as a work array.
        read -r -a words <<< "${line,,}"
        set -- "${words[@]}"

        # Keep looping until all the positional params
        # have been consumed.
        while (( $# > 0 )); do
            word=$1
            shift

            if is_number "$word"; then
                stack::push "$word"
            elif [[ -n ${macros[$word]} ]]; then
                read -r -a words <<< "${macros[$word]}"
                set -- "${words[@]}" "$@"
            else
                case $word in
                :)
                    record_macro "$@"
                    # Discard rest of line
                    set --
                    ;;
                [-+*/])
                    # Arithmetic operation
                    binary_op "$word"
                    ;;
                dup|drop|swap|over)
                    # Invoke this word as a command
                    "$word"
                    ;;
                *)
                    echo "undefined operation" >&2
                    exit 1
                    ;;
                esac
            fi
        done
    done

    echo "${stack[*]}"
}

record_macro() {
    local macro_name=$1
    if is_number "$macro_name"; then
        die "illegal operation: cannot redefine number"
    fi
    shift

    # Check the last word
    [[ ${!#} != ";" ]] && die "macro not terminated with semicolon"
    # pop the semicolon
    set -- "${@:1:$#-1}"

    (( $# == 0 )) && die "empty macro definition"

    # Check any words in definition for macros
    local definition=() words=()
    for word; do
        if [[ -n ${macros[$word]} ]]; then
            read -r -a words <<< "${macros[$word]}"
            definition+=( "${words[@]}" )
        else
            definition+=( "$word" )
        fi
    done
    macros[$macro_name]=${definition[*]}
}

# Check the size of the stack for the number of needed elements
need() {
    local -i n=$1 len
    len=$(stack::len)
    (( n > 0 && len == 0 )) && die "empty stack"
    (( n > 1 && len == 1 )) && die "only one value on the stack"
    (( n > len ))           && die "not enough values on the stack"
}

binary_op() {
    local op=$1 a b

    need 2
    b=$(stack::tail)
    stack::pop
    a=$(stack::tail)
    stack::pop

    [[ $op == "/" ]] && (( b == 0 )) && die "divide by zero"
    case $op in
        +)  stack::push "$(( a + b ))" ;;
        -)  stack::push "$(( a - b ))" ;;
        \*) stack::push "$(( a * b ))" ;;
        /)  stack::push "$(( a / b ))" ;;
    esac
}

dup() {
    need 1
    stack::push "$(stack::tail)"
}

drop() {
    need 1
    stack::pop
}

swap() {
    local a b
    need 2
    b=$(stack::tail)
    stack::pop
    a=$(stack::tail)
    stack::pop
    stack::push "$b" "$a"
}

over() {
    local a b
    need 2
    b=$(stack::tail)
    stack::pop
    a=$(stack::tail)
    stack::push "$b" "$a"
}

main
