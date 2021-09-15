#!/usr/bin/env bats
load bats-extra

# local version: 1.5.0.0

@test "no multiples within limit" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1 3 5
    assert_success
    assert_output "0"
}

@test "one factor has multiples within limit" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 4 3 5
    assert_success
    assert_output "3"
}

@test "more than one multiple within limit" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 7 3
    assert_success
    assert_output "9"
}

@test "more than one factor with multiples within limit" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10 3 5
    assert_success
    assert_output "23"
}

@test "each multiple is only counted once" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 100 3 5
    assert_success
    assert_output "2318"
}

@test "a much larger limit" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1000 3 5
    assert_success
    assert_output "233168"
}

@test "three factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 20 7 13 17
    assert_success
    assert_output "51"
}

@test "factors not relatively prime" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 15 4 6
    assert_success
    assert_output "30"
}

@test "some pairs of factors relatively prime and some not" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 150 5 6 8
    assert_success
    assert_output "4419"
}

@test "one factor is a multiple of another" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 51 5 25
    assert_success
    assert_output "275"
}

@test "much larger factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 43 47
    assert_success
    assert_output "2203160"
}

@test "all numbers are multiples of 1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 100 1
    assert_success
    assert_output "4950"
}

@test "no factors means an empty sum" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 
    assert_success
    assert_output "0"
}

@test "the only multiple of 0 is 0" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 1 0
    assert_success
    assert_output "0"
}

@test "the factor 0 does not affect the sum of multiples of other factors" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 4 3 0
    assert_success
    assert_output "3"
}

@test "solutions using include-exclude must extend to cardinality greater than 3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sum_of_multiples.sh 10000 2 3 5 7 11
    assert_success
    assert_output "39614537"
}
