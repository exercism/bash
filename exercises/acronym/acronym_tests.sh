#!/usr/bin/env bats

@test "basic" {
    run bash acronym.sh "Portable Network Graphics"
    [ "$status" -eq 0 ]
    [ "$output" = "PNG" ]
}

@test "lowercase words" {
    run bash acronym.sh "Ruby on Rails"
    [ "$status" -eq 0 ]
    [ "$output" = "ROR" ]
}

@test "punctuation" {
    run bash acronym.sh "First In, First Out"
    [ "$status" -eq 0 ]
    [ "$output" = "FIFO" ]
}

@test "all caps words" {
    run bash acronym.sh "PHP: Hypertext Preprocessor"
    [ "$status" -eq 0 ]
    [ "$output" = "PHP" ]
}

@test "non-acronym all caps word" {
    run bash acronym.sh "GNU Image Manipulation Program"
    [ "$status" -eq 0 ]
    [ "$output" = "GIMP" ]
}

@test "hyphenated" {
    run bash acronym.sh "Complementary metal-oxide semiconductor"
    [ "$status" -eq 0 ]
    [ "$output" = "CMOS" ]
}
