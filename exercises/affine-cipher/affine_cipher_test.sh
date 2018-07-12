#!/usr/bin/env bats

@test "encode yes" {
    #skip
    run bash example.sh encode 5 7 "yes"
    [ "$status" -eq 0 ]
    [ "$output" = "xbt" ]
}

@test "encode no" {
    skip
    run bash example.sh encode 15 18 "no"
    [ "$status" -eq 0 ]
    [ "$output" = "fu" ]
}

@test "encode OMG" {
    skip
    run bash example.sh encode 21 3 "OMG"
    [ "$status" -eq 0 ]
    [ "$output" = "lvz" ]
}

@test "encode spaces" {
    skip
    run bash example.sh encode 25 47 "O M G"
    [ "$status" -eq 0 ]
    [ "$output" = "hjp" ]
}

@test "encode mindblowingly" {
    skip
    run bash example.sh encode 11 15 "mindblowingly"
    [ "$status" -eq 0 ]
    [ "$output" = "rzcwa gnxzc dgt" ]
}

@test "encode numbers" {
    skip
    run bash example.sh encode 3 4 "Testing,1 2 3, testing."
    [ "$status" -eq 0 ]
    [ "$output" = "jqgjc rw123 jqgjc rw" ]
}

@test "encode deep thought" {
    skip
    run bash example.sh encode 5 17 "Truth is fiction."
    [ "$status" -eq 0 ]
    [ "$output" = "iynia fdqfb ifje" ]
}

@test "encode all the letters" {
    skip
    run bash example.sh encode 17 33 "The quick brown fox jumps over the lazy dog."
    [ "$status" -eq 0 ]
    [ "$output" = "swxtj npvyk lruol iejdc blaxk swxmh qzglf" ]
}

@test "encode from pipe" {
    skip
    [[ "$(echo 'This is a test.' | bash example.sh encode 15 12)"\
     = "lncwc wmluw l" ]]
}

@test "encode from file" {
    skip
    [[ "$(bash example.sh encode 5 7 affine_cipher_test.sh)"\
     = "$(cat affine_cipher_test.sh | bash example.sh encode 5 7)" ]] 
}

@test "encode with a not coprime to m" {
    skip
    run bash example.sh encode 6 17 "This is a test."
    [ "$status" -eq 1 ]
    [ "$output" = "Error: a and m must be coprime." ]
}

@test "decode exercism" {
    skip
    run bash example.sh decode 3 7 "tytgn fjr"
    [ "$status" -eq 0 ]
    [ "$output" = "exercism" ]
}

@test "decode a sentence" {
    skip
    run bash example.sh decode 19 16 "qdwju nqcro muwhn odqun oppmd aunwd o"
    [ "$status" -eq 0 ]
    [ "$output" = "anobstacleisoftenasteppingstone" ]
}

@test "decode numbers" {
    skip
    run bash example.sh decode 25 7 "odpoz ub123 odpoz ub"
    [ "$status" -eq 0 ]
    [ "$output" = "testing123testing" ]
}

@test "decode all the letters" {
    skip
    run bash example.sh decode 17 33 "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
    [ "$status" -eq 0 ]
    [ "$output" = "thequickbrownfoxjumpsoverthelazydog" ]
}

@test "decode with a not coprime to m" {
    skip
    run bash example.sh decode 13 5 "Test"
    [ "$status" -eq 1 ]
    [ "$output" = "Error: a and m must be coprime." ]
}

@test "decode from pipe" {
    skip
    [[ "$(echo "lncwc wmluw l" | bash example.sh decode 15 12)" = "thisisatest" ]]
}

@test "decode and encode" {
    skip
    [[ "$(echo 'pipes make it feel unixy!' | bash example.sh encode 3 42 | bash example.sh decode 3 42 )"\
     = "pipesmakeitfeelunixy" ]]
}

