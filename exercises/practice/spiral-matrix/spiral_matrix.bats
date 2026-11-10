#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_empty_spiral() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 0
    expected=""
    assert_success
    assert_output "$expected"
}

test_trivial_spiral() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 1
    expected="1"
    assert_success
    assert_output "$expected"
}

test_spiral_of_size_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 2
    expected="1 2
4 3"
    assert_success
    assert_output "$expected"
}

test_spiral_of_size_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 3
    expected="1 2 3
8 9 4
7 6 5"
    assert_success
    assert_output "$expected"
}

test_spiral_of_size_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 4
    expected="1 2 3 4
12 13 14 5
11 16 15 6
10 9 8 7"
    assert_success
    assert_output "$expected"
}

test_spiral_of_size_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash spiral_matrix.sh 5
    expected="1 2 3 4 5
16 17 18 19 6
15 24 25 20 7
14 23 22 21 8
13 12 11 10 9"
    assert_success
    assert_output "$expected"
}
