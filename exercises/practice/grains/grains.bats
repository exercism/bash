#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_returns_the_number_of_grains_on_the_square_grains_on_square_1() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 1
    assert_success
    assert_output "1"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 2
    assert_success
    assert_output "2"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 3
    assert_success
    assert_output "4"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 4
    assert_success
    assert_output "8"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_16() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 16
    assert_success
    assert_output "32768"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_32() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 32
    assert_success
    assert_output "2147483648"
}

test_returns_the_number_of_grains_on_the_square_grains_on_square_64() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 64
    assert_success
    assert_output "9223372036854775808"
}

test_returns_the_number_of_grains_on_the_square_square_0_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 0
    assert_failure
    assert_output "Error: invalid input"
}

test_returns_the_number_of_grains_on_the_square_negative_square_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh -1
    assert_failure
    assert_output "Error: invalid input"
}

test_returns_the_number_of_grains_on_the_square_square_greater_than_64_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh 65
    assert_failure
    assert_output "Error: invalid input"
}

test_returns_the_total_number_of_grains_on_the_board() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash grains.sh total
    assert_success
    assert_output "18446744073709551615"
}
