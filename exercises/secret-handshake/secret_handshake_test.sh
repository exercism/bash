#!/usr/bin/env bash

# local version: 1.2.0.0

@test "wink for 1" {
    #[[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 1
    [[ $status -eq 0 ]]
    [[ $output == "wink" ]]
}

@test "double blink for 10" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 2
    [[ $status -eq 0 ]]
    [[ $output == "double blink" ]]
}

@test "close your eyes for 100" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 4
    [[ $status -eq 0 ]]
    [[ $output == "close your eyes" ]]
}

@test "jump for 1000" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 8
    [[ $status -eq 0 ]]
    [[ $output == "jump" ]]
}

@test "combine two actions" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 3
    [[ $status -eq 0 ]]
    [[ $output == "wink,double blink" ]]
}

@test "all possible actions" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 15
    [[ $status -eq 0 ]]
    [[ $output == "wink,double blink,close your eyes,jump" ]]
}

@test "do nothing for zero" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 0
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "reversing no actions still gives no actions" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 16
    [[ $status -eq 0 ]]
    [[ $output == "" ]]
}

@test "reversing one action gives the same action" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 24
    [[ $status -eq 0 ]]
    [[ $output == "jump" ]]
}

@test "reverse two actions" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 19
    [[ $status -eq 0 ]]
    [[ $output == "double blink,wink" ]]
}

@test "reverse all possible actions" {
    [[ $BATS_RUN_SKIPPED == true  ]] || skip
    run bash secret_handshake.sh 31
    [[ $status -eq 0 ]]
    [[ $output == "jump,close your eyes,double blink,wink" ]]
}
