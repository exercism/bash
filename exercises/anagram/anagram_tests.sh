#!/usr/bin/env bats

@test "no matches", {
    run bash anagram.sh "diaper" "hello world zombies pants"
    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}

@test "detects simple anagram" {
    run bash anagram.sh "ant" "tan stand at"
    [ "$status" -eq 0 ]
    [ "$output" = "tan" ]
}

