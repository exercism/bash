#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_slices_of_one_from_one() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1"
    run bash series.sh "1" 1
    assert_success
    assert_output "$expected"
}

test_slices_of_one_from_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="1 2"
    run bash series.sh "12" 1
    assert_success
    assert_output "$expected"
}

test_slices_of_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="35"
    run bash series.sh "35" 2
    assert_success
    assert_output "$expected"
}

test_slices_of_two_overlap() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="91 14 42"
    run bash series.sh "9142" 2
    assert_success
    assert_output "$expected"
}

test_slices_can_include_duplicates() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="777 777 777 777"
    run bash series.sh "777777" 3
    assert_success
    assert_output "$expected"
}

test_slices_of_a_long_series() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="91849 18493 84939 49390 93904 39042 90424 04243"
    run bash series.sh "918493904243" 5
    assert_success
    assert_output "$expected"
}

test_slice_length_is_too_large() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be greater than series length"
    run bash series.sh "12345" 6
    assert_failure
    assert_output --partial "$expected"
}

test_slice_length_is_way_too_large() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be greater than series length"
    run bash series.sh "12345" 42
    assert_failure
    assert_output --partial "$expected"
}

test_slice_length_cannot_be_zero() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be zero"
    run bash series.sh "12345" 0
    assert_failure
    assert_output --partial "$expected"
}

test_slice_length_cannot_be_negative() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="slice length cannot be negative"
    run bash series.sh "123" -1
    assert_failure
    assert_output --partial "$expected"
}

test_empty_series_is_invalid() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="series cannot be empty"
    run bash series.sh "" 1
    assert_failure
    assert_output --partial "$expected"
}
