#!/usr/bin/env bash

# Chromatic scales

@test "Chromatic scale with sharps" {
    #skip
    expected="C C# D D# E F F# G G# A A# B" 
    run bash scale_generator.sh "C"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Chromatic scale with flats" {
    skip
    expected="F Gb G Ab A Bb B C Db D Eb E" 
    run bash scale_generator.sh "F"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

# Scales with specified intervals


@test "Simple major scale" {
    skip
    expected="C D E F G A B" 
    run bash scale_generator.sh "C" "MMmMMMm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Major scale with sharps" {
    skip
    expected="G A B C D E F#" 
    run bash scale_generator.sh "G" "MMmMMMm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Major scale with flats" {
    skip
    expected="F G A Bb C D E" 
    run bash scale_generator.sh "F" "MMmMMMm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Minor scale with sharps" {
    skip
    expected="F# G# A B C# D E" 
    run bash scale_generator.sh "f#" "MmMMmMM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Minor scale with flats" {
    skip
    expected="Bb C Db Eb F Gb Ab" 
    run bash scale_generator.sh "bb" "MmMMmMM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Dorian mode" {
    skip
    expected="D E F G A B C" 
    run bash scale_generator.sh "d" "MmMMMmM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Mixolydian mode" {
    skip
    expected="Eb F G Ab Bb C Db" 
    run bash scale_generator.sh "Eb" "MMmMMmM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Lydian mode" {
    skip
    expected="A B C# D# E F# G#" 
    run bash scale_generator.sh "a" "MMMmMMm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Phrygian mode" {
    skip
    expected="E F G A B C D" 
    run bash scale_generator.sh "e" "mMMMmMM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Locrian mode" {
    skip
    expected="G Ab Bb C Db Eb F" 
    run bash scale_generator.sh "g" "mMMmMMM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Harmonic minor" {
    skip
    expected="D E F G A Bb Db" 
    run bash scale_generator.sh "d" "MmMMmAm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Octatonic" {
    skip
    expected="C D D# F F# G# A B" 
    run bash scale_generator.sh "C" "MmMmMmMm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Hexatonic" {
    skip
    expected="Db Eb F G A B" 
    run bash scale_generator.sh "Db" "MMMMMM"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Pentatonic" {
    skip
    expected="A B C# E F#" 
    run bash scale_generator.sh "A" "MMAMA"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test "Enigmatic" {
    skip
    expected="G G# B C# D# F F#" 
    run bash scale_generator.sh "G" "mAMMMmm"
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

# error conditions

@test "no args" {
    skip
    expected="not enough arguments"
    run bash scale_generator.sh
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "too many args" {
    skip
    expected="too many arguments"
    run bash scale_generator.sh A A A
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "bad tonic" {
    skip
    expected="invalid tonic"
    run bash scale_generator.sh "foo"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}

@test "bad interval" {
    skip
    expected="invalid interval"
    run bash scale_generator.sh "C" "foo"
    [[ $status -ne 0 ]]
    [[ $output == *"$expected"* ]]
}
