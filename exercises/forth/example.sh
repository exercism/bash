#!/usr/bin/env bash

set -f                  # disable path exansion
shopt -s extglob        # enable extended patterns

# I'm going to use the stack and the macros as 
# global variables: Not best practice.
declare -a stack        # indexed array
declare -A macros       # associative array

# Encapsulate some stack operations
stack::len()  { echo ${#stack[@]}; }
stack::tail() { echo ${stack[-1]}; }
stack::pop()  { stack=( ${stack[@]:0:$(stack::len)-1} ); }
stack::push() { stack+=( $* ); }

# True if the first argument consists of digits only
is_number() { [[ $1 == +([0-9]) ]]; }

die() { echo "$*" >&2; exit 1; }

#
# The main function
#
main() {
    # Read from stdin
    while IFS= read -r line; do

        # Lower-case the line, and allow word-splitting.
        # Use the positional parameters as a work array.
        set -- ${line,,}

        # Keep looping until all the positional params
        # have been consumed.
        while (( $# > 0 )); do
            word=$1
            shift

            if is_number $word; then
                stack::push $word
            elif [[ -n ${macros[$word]} ]]; then
                set -- ${macros[$word]} $*
            else
                case $word in
                :)
                    record_macro $*
                    # Discard rest of line
                    set --
                    ;;
                [-+*/])
                    # Arithmetic operation
                    binary_op $word
                    ;;
                dup|drop|swap|over)
                    # Invoke this word as a command
                    $word
                    ;;
                *)
                    echo "undefined operation" >&2
                    exit 1
                    ;;
                esac
            fi
        done
    done

    echo ${stack[*]}
}

record_macro() {
    local macro_name=$1
    if is_number $macro_name; then 
        die "illegal operation: cannot redefine number"
    fi
    shift

    # Check the last word
    [[ ${!#} != ";" ]] && die "macro not terminated with semicolon"
    # pop the semicolon
    set -- ${@:1:$#-1}

    (( $# == 0 )) && die "empty macro definition"

    # Check any words in definition for macros
    local definition=()
    for word; do
        if [[ -n ${macros[$word]} ]]; then
            definition+=( ${macros[$word]} )
        else
            definition+=( $word )
        fi
    done
    macros[$macro_name]=${definition[*]}
}

# Check the size of the stack for the number of needed elements
need() {
    local -i n=$1
    local -i len=$(stack::len)
    (( n > 0 && len == 0 )) && die "empty stack"
    (( n > 1 && len == 1 )) && die "only one value on the stack"
    (( n > len ))           && die "not enough values on the stack"
}

binary_op() {
    local op=$1

    need 2
    local b=$(stack::tail)
    stack::pop
    local a=$(stack::tail)
    stack::pop
    
    [[ $op == "/" ]] && (( b == 0 )) && die "divide by zero"
    stack::push $(( a $op b ))
}

dup() {
    need 1
    stack::push $(stack::tail)
}

drop() {
    need 1
    stack::pop
}

swap() {
    need 2
    local b=$(stack::tail)
    stack::pop
    local a=$(stack::tail)
    stack::pop
    stack::push $b $a
}

over() {
    need 2
    local b=$(stack::tail)
    stack::pop
    local a=$(stack::tail)
    stack::push $b $a
}

main
