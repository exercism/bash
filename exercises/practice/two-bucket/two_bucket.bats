#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_one() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 4, goalBucket: one, otherBucket: 5"
    run bash two_bucket.sh 3 5 1 "one"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 8, goalBucket: two, otherBucket: 3"
    run bash two_bucket.sh 3 5 1 "two"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 14, goalBucket: one, otherBucket: 11"
    run bash two_bucket.sh 7 11 2 "one"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 18, goalBucket: two, otherBucket: 7"
    run bash two_bucket.sh 7 11 2 "two"
    assert_success
    assert_output "$expected"
}

test_measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3_start_with_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 1, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 1 3 3 "two"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3_start_with_bucket_one_and_end_with_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 2, goalBucket: two, otherBucket: 2"
    run bash two_bucket.sh 2 3 3 "one"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_much_bigger_than_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 6, goalBucket: one, otherBucket: 1"
    run bash two_bucket.sh 5 1 2 "one"
    assert_success
    assert_output "$expected"
}

test_measure_using_bucket_one_much_smaller_than_bucket_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 6, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 3 15 9 "one"
    assert_success
    assert_output "$expected"
}

test_not_possible_to_reach_the_goal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash two_bucket.sh 6 15 5 "one"
    assert_failure
    assert_output --partial "invalid goal"
}

test_with_the_same_buckets_but_a_different_goal_then_it_is_possible() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="moves: 10, goalBucket: two, otherBucket: 0"
    run bash two_bucket.sh 6 15 9 "one"
    assert_success
    assert_output "$expected"
}

test_goal_larger_than_both_buckets_is_impossible() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash two_bucket.sh 5 7 8 "one"
    assert_failure
    assert_output --partial "invalid goal"
}
