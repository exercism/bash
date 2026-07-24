#!/usr/bin/env bash

transmit_sequence() {
    local hex inlined i bits parity_check
    local -a hex_output

    [[ -z "$*" ]] && echo "" && exit 0

    for hex in $1; do
        hex="$(( 16#${hex:2} ))"

        for (( i=7; i>=0; i-- )); do
            inlined+="$(( (hex >> i) & 1 ))"
        done
    done

    for (( i = 0; i < ${#inlined}; i+=7 )); do
        bits="${inlined:$i:7}"

        while (( ${#bits} < 7 )); do
            bits+="0"
        done

        parity_check="${bits//0/}"

        if (( ${#parity_check} % 2 == 0 )); then
            bits+="0"
        else
            bits+="1"
        fi

        hex_output+=( "$(printf "0x%02x\n" "$(( 2#$bits ))")" )
    done

    echo "${hex_output[*]}"
}

decode_message() {
    local hex bits parity_check i inlined
    local -a hex_output

    [[ -z "$*" ]] && echo "" && exit 0

    for hex in $1; do
        hex="$(( 16#${hex:2} ))"
        bits=""

        for (( i=7; i>=0; i-- )); do
            bits+="$(( (hex >> i) & 1 ))"
        done

        parity_check="${bits//0/}"

        if (( ${#parity_check} % 2 == 0 )); then
            inlined+="${bits:0:7}"
        else
            echo 'wrong parity' && exit 0
        fi
    done

    for (( i = 0; i < ${#inlined}; i+=8 )); do
       bits="${inlined:$i:8}"

       (( ${#bits} < 8 )) && continue
        hex_output+=( "$(printf "0x%02x\n" "$(( 2#$bits ))")" )

    done

    echo "${hex_output[*]}"
}

"$@"
