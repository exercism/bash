#!/usr/bin/env bats

@test "correct arguments" {
    #skip
    run bash error_handling.sh Alice
    
    [ "$status" -eq 0 ]
    [ "$output" = "Hello, Alice" ]
}

@test "one long argument" {
    skip
    run bash error_handling.sh "Alice and Bob"
    
    [ "$status" -eq 0 ]
    [ "$output" = "Hello, Alice and Bob" ]
}

@test "incorrect arguments" {
    skip
    run bash error_handling.sh Alice Bob

    [ "$status" -ne 0 ]
}

@test "use errexit" {
    skip
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'errexit' ]
}

@test "use nounset" {
    skip
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'nounset' ]
}
