#!/usr/bin/env bats

@test "encode yes" {
    run bash example.sh encode "yes"
    [ "$status" -eq 0 ]
    [ "$output" = "bvh" ]
}

@test "encode no" {
    run bash example.sh encode "no"
    [ "$status" -eq 0 ]
    [ "$output" = "ml" ]
}

@test "encode OMG" {
    run bash example.sh encode "OMG"
    [ "$status" -eq 0 ]
    [ "$output" = "lnt" ]
}

@test "encode spaces" {
    run bash example.sh encode "O M G"
    [ "$status" -eq 0 ]
    [ "$output" = "lnt" ]
}

@test "encode mindblowingly" {
    run bash example.sh encode "mindblowingly"
    [ "$status" -eq 0 ]
    [ "$output" = "nrmwy oldrm tob" ]
}

@test "encode numbers" {
    run bash example.sh encode "Testing,1 2 3, testing."
    [ "$status" -eq 0 ]
    [ "$output" = "gvhgr mt123 gvhgr mt" ]
}

@test "encode deep thought" {
    run bash example.sh encode "Truth is fiction."
    [ "$status" -eq 0 ]
    [ "$output" = "gifgs rhurx grlm" ]
}

@test "encode all the letters" {
    run bash example.sh encode "The quick brown fox jumps over the lazy dog."
    [ "$status" -eq 0 ]
    [ "$output" = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" ]
}

@test "decode exercism" {
    run bash example.sh decode "vcvix rhn"
    [ "$status" -eq 0 ]
    [ "$output" = "exercism" ]
}

@test "decode a sentence" {
    run bash example.sh decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    [ "$status" -eq 0 ]
    [ "$output" = "anobstacleisoftenasteppingstone" ]
}

@test "decode numbers" {
    run bash example.sh decode "gvhgr mt123 gvhgr mt"
    [ "$status" -eq 0 ]
    [ "$output" = "testing123testing" ]
}

@test "decode all the letters" {
    run bash example.sh decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    [ "$status" -eq 0 ]
    [ "$output" = "thequickbrownfoxjumpsoverthelazydog" ]
}