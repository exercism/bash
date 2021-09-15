#!/usr/bin/env bats
load bats-extra

# local version: 1.1.0.0

# "Perfect numbers"

@test "Smallest perfect number is classified correctly" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 6
    assert_success 
    assert_output "perfect"
}

@test "Medium perfect number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 28
    assert_success 
    assert_output "perfect"
}

@test "Large perfect number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550336
    assert_success 
    assert_output "perfect"
}

# "Abundant numbers"

@test "Smallest abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 12
    assert_success 
    assert_output "abundant"
}

@test "Medium abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 30
    assert_success 
    assert_output "abundant"
}

@test "Large abundant number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550335
    assert_success 
    assert_output "abundant"
}

# "Deficient numbers"

@test "Smallest prime deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 2
    assert_success
    assert_output "deficient"
}

@test "Smallest non-prime deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 4
    assert_success
    assert_output "deficient"
}

@test "Medium deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 32
    assert_success 
    assert_output "deficient"
}

@test "Large deficient number is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 33550337
    assert_success 
    assert_output "deficient"
}

@test "Edge case (no factors other than itself) is classified correctly" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 1
    assert_success 
    assert_output "deficient"
}

# "Invalid inputs"

@test "Zero is rejected (not a natural number)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh 0
    assert_failure 
    assert_output "Classification is only possible for natural numbers."
}

@test "Negative integer is rejected (not a natural number)" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash perfect_numbers.sh -1
    assert_failure 
    assert_output "Classification is only possible for natural numbers."
}
