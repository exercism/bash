#!/usr/bin/env bats

@test "encode yes" {
    run affine encode 5 7 "yes"
    [ "$status" -eq 0 ]
    [ "$output" = "jnf" ]
}

@test "encode no" {
    run affine encode 15 18 "no"
    [ "$status" -eq 0 ]
    [ "$output" = "vk" ]
}

@test "encode OMG" {
    run affine encode 21 3 "OMG"
    [ "$status" -eq 0 ]
    [ "$output" = "fpt" ]
}

@test "encode spaces" {
    run affine encode 25 47 "O M G"
    [ "$status" -eq 0 ]
    [ "$output" = "rtz" ]
}

@test "encode mindblowingly" {
    run affine encode 11 15 "mindblowingly"
    [ "$status" -eq 0 ]
    [ "$output" = "nvysw cjtvy zcp" ]
}

@test "encode numbers" {
    run affine encode 3 4 "Testing,1 2 3, testing."
    [ "$status" -eq 0 ]
    [ "$output" = "biybu jo123 biybu jo" ]
}

@test "encode deep thought" {
    run affine encode 5 17 "Truth is fiction."
    [ "$status" -eq 0 ]
    [ "$output" = "aqfas xvixt axbw" ]
}

@test "encode all the letters" {
    run affine encode 17 33 "The quick brown fox jumps over the lazy dog."
    [ "$status" -eq 0 ]
    [ "$output" = "eijfv zbhkw xdgax uqvpo nxmjw eijyt clsxr" ]
}

@test "encode from pipe" {
    [[ "$(echo 'This is a test.' | affine encode 15 12)" = "npeye yonwy n" ]]
}

@test "encode from file" {
    [[ "$(affine encode 5 7 affine_cipher_test.sh)"\
     = "$(cat affine_cipher_test.sh | affine encode 5 7)" ]] 
}

@test "encode with a not coprime to m" {
    run affine encode 6 17 "This is a test."
    [ "$status" -eq 1 ]
    [ "$output" = "Error: a and m must be coprime." ]
}

@test "decode exercism" {
    run affine decode 3 7 "fkfsz rvd"
    [ "$status" -eq 0 ]
    [ "$output" = "exercism" ]
}

@test "decode a sentence" {
    run affine decode 19 16 "kxqdo hkwli goqbh ixkoh ijjgx uohqx i"
    [ "$status" -eq 0 ]
    [ "$output" = "anobstacleisoftenasteppingstone" ]
}

@test "decode numbers" {
    run affine decode 25 7 "apbal gn123 apbal gn"
    [ "$status" -eq 0 ]
    [ "$output" = "testing123testing" ]
}

@test "decode all the letters" {
    run affine decode 17 33 "eijfv zbhkw xdgax uqvpo nxmjw eijyt clsxr"
    [ "$status" -eq 0 ]
    [ "$output" = "thequickbrownfoxjumpsoverthelazydog" ]
}

@test "decode with a not coprime to m" {
    run affine decode 13 5 "Test"
    [ "$status" -eq 1 ]
    [ "$output" = "Error: a and m must be coprime." ]
}

@test "decode from pipe" {
    [[ "$(echo "npeye yonwy n" | affine decode 15 12)" = "thisisatest" ]]
}

@test "decode and encode" {
    [[ "$(echo 'pipes make it feel unixy!' | affine encode 3 42 | affine decode 3 42 )"\
     = "pipesmakeitfeelunixy" ]]
}

