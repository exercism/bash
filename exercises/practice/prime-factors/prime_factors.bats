#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_no_factors() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    run bash prime_factors.sh 1
    assert_success
    assert_output "$expected"
}

test_prime_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2"
    run bash prime_factors.sh 2
    assert_success
    assert_output "$expected"
}

test_another_prime_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="3"
    run bash prime_factors.sh 3
    assert_success
    assert_output "$expected"
}

test_square_of_a_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="3 3"
    run bash prime_factors.sh 9
    assert_success
    assert_output "$expected"
}

test_product_of_first_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2"
    run bash prime_factors.sh 4
    assert_success
    assert_output "$expected"
}

test_cube_of_a_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 2"
    run bash prime_factors.sh 8
    assert_success
    assert_output "$expected"
}

test_product_of_second_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="3 3 3"
    run bash prime_factors.sh 27
    assert_success
    assert_output "$expected"
}

test_product_of_third_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="5 5 5 5"
    run bash prime_factors.sh 625
    assert_success
    assert_output "$expected"
}

test_product_of_first_and_second_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 3"
    run bash prime_factors.sh 6
    assert_success
    assert_output "$expected"
}

test_product_of_primes_and_non_primes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 2 3"
    run bash prime_factors.sh 12
    assert_success
    assert_output "$expected"
}

test_product_of_primes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="5 17 23 461"
    run bash prime_factors.sh 901255
    assert_success
    assert_output "$expected"
}

test_factors_include_a_large_prime() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="11 9539 894119"
    run bash prime_factors.sh 93819012551
    assert_success
    assert_output "$expected"
}
