#!/usr/bin/env bats

@test "no matches", {
    #skip
    run bash anagram.sh "diaper" "hello world zombies pants"
    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}

@test "detects simple anagram" {
    skip
    run bash anagram.sh "ant" "tan stand at"
    [ "$status" -eq 0 ]
    [ "$output" = "tan" ]
}

@test "does not detect false positives" {
    skip
    run bash anagram.sh "galea" "eagle"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects two anagrams" {
    skip
    run bash anagram.sh "master" "stream pigeon maters"

    [ "$status" -eq 0 ]
    [ "$output" = "stream maters" ]
}
@test "does not detect anagram subsets" {
    skip
    run bash anagram.sh "good" "dog goody"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects anagram" {
    skip
    run bash anagram.sh "listen" "enlists google inlets banana"

    [ "$status" -eq 0 ]
    [ "$output" = "inlets" ]
}
@test "detects three anagrams" {
    skip
    run bash anagram.sh "allergy" "gallery ballerina regally clergy largely leading"

    [ "$status" -eq 0 ]
    [ "$output" = "gallery regally largely" ]
}
@test "does not detect identical words" {
    skip
    run bash anagram.sh "corn" "corn dark Corn rank CORN cron park"

    [ "$status" -eq 0 ]
    [ "$output" = "cron" ]
}
@test "does not detect non-anagrams with identical checksum" {
    skip
    run bash anagram.sh "mass" "last"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects anagrams case-insensitively" {
    skip
    run bash anagram.sh "Orchestra" "cashregister Carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "Carthorse" ]
}
@test "detects anagrams using case-insensitive subject" {
    skip
    run bash anagram.sh "Orchestra" "cashregister carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "carthorse" ]
}
@test "detects anagrams using case-insensitive possible matches" {
    skip
    run bash anagram.sh "orchestra" "cashregister Carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "Carthorse" ]
}
@test "does not detect a word as its own anagram" {
    skip
    run bash anagram.sh "banana" "Banana"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "does not detect a anagram if the original word is repeated" {
    skip
    run bash anagram.sh "go" "go Go GO"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "anagrams must use all letters exactly once" {
    skip
    run bash anagram.sh "tapper" "patter"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "capital word is not own anagram" {
    skip
    run bash anagram.sh "BANANA" "Banana"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}

