#!/usr/bin/env bash

# local version: 2.0.0.1
# bash-specific test: Input validation, lower-casing

# Random key cipher"

@test  "Can generate a random key" {
    #[[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh key
    (( status == 0 ))
    key=$output
    (( ${#key} >= 100 ))     # at least 100 chars
    [[ $key != [^[:lower:]] ]]    # only lowercase letters
}

@test  "Can encode random" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh key
    (( status == 0 ))
    key=$output
    plaintext="aaaaaaaaaa"
    run bash simple_cipher.sh -k "$key" encode "$plaintext"
    (( status == 0 ))
    (( ${#output} == 10 ))
    [[ $output == "${key:0:10}" ]]
}

@test  "Can decode random" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh key
    (( status == 0 ))
    key=$output
    plaintext="aaaaaaaaaa"
    run bash simple_cipher.sh -k "$key" decode "${key:0:10}"
    (( status == 0 ))
    (( ${#output} == 10 ))
    [[ $output == "$plaintext" ]]
}

@test "Is reversible random" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh key
    (( status == 0 ))
    key=$output

    plaintext="abcdefghij"
    run bash simple_cipher.sh -k "$key" encode "$plaintext"
    (( status == 0 ))
    encoded=$output

    run bash simple_cipher.sh -k "$key" decode "$encoded"
    (( status == 0 ))
    [[ $output == "$plaintext" ]]
}

# Substitution cipher

@test  "Can encode" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abcdefghij
    txt=aaaaaaaaaa
    run bash simple_cipher.sh -k "$key" encode "$txt"
    (( status == 0 ))
    [[ $output == "$key" ]]
}

@test  "Can decode" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abcdefghij
    txt=abcdefghij
    exp=aaaaaaaaaa
    run bash simple_cipher.sh -k "$key" decode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Is reversible" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abcdefghij
    txt=abcdefghij
    exp=abcdefghij
    run bash simple_cipher.sh -k "$key" encode "$txt"
    (( status == 0 ))
    encoded=$output
    run bash simple_cipher.sh -k "$key" decode "$encoded"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Can double shift encode" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=iamapandabear
    txt=iamapandabear
    exp=qayaeaagaciai
    run bash simple_cipher.sh -k "$key" encode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Can wrap on encode"  {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abcdefghij
    txt=zzzzzzzzzz
    exp=zabcdefghi
    run bash simple_cipher.sh -k "$key" encode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Can wrap on decode" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abcdefghij
    txt=zabcdefghi
    exp=zzzzzzzzzz
    run bash simple_cipher.sh -k "$key" decode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Can encode messages longer than the key" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abc
    txt=iamapandabear
    exp=iboaqcnecbfcr
    run bash simple_cipher.sh -k "$key" encode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test  "Can decode messages longer than the key" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    key=abc
    txt=iboaqcnecbfcr
    exp=iamapandabear
    run bash simple_cipher.sh -k "$key" decode "$txt"
    (( status == 0 ))
    [[ $output == "$exp" ]]
}

@test "plaintext is lowercased" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh -k b encode FOOBAR
    (( status == 0 ))
    [[ $output == "gppcbs" ]]
}

@test "ciphertext is lowercased" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh -k b decode GPPCBS
    (( status == 0 ))
    [[ $output == "foobar" ]]
}

# errors

@test "key must be lowercase" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh -k ABC encode foo
    (( status == 1 ))
    [[ $output == *"invalid key"* ]]
}

@test "key must be letters" {
    [[ $BATS_RUN_SKIPPED == true ]] || skip
    run bash simple_cipher.sh -k 123 encode foo
    (( status == 1 ))
    [[ $output == *"invalid key"* ]]
}
