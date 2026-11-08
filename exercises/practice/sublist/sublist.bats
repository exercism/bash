#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

# Lists are ordered and sequential: do not sort or reorder them.
# Lists are given in JSON format.

test_empty_lists() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[]" "[]"
    assert_success
    assert_output "equal"
}

test_empty_list_within_non_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[]" "[1, 2, 3]"
    assert_success
    assert_output "sublist"
}

test_non_empty_list_contains_empty_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[]"
    assert_success
    assert_output "superlist"
}

test_list_equals_itself() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[1, 2, 3]"
    assert_success
    assert_output "equal"
}

test_different_lists() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[2, 3, 4]"
    assert_success
    assert_output "unequal"
}

test_false_start() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 5]" "[0, 1, 2, 3, 1, 2, 5, 6]"
    assert_success
    assert_output "sublist"
}

test_consecutive() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 1, 2]" "[0, 1, 1, 1, 2, 1, 2]"
    assert_success
    assert_output "sublist"
}

test_sublist_at_start() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[0, 1, 2]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

test_sublist_in_middle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[2, 3, 4]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

test_sublist_at_end() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[3, 4, 5]" "[0, 1, 2, 3, 4, 5]"
    assert_success
    assert_output "sublist"
}

test_at_start_of_superlist() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[0, 1, 2]"
    assert_success
    assert_output "superlist"
}

test_in_middle_of_superlist() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[2, 3]"
    assert_success
    assert_output "superlist"
}

test_at_end_of_superlist() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[0, 1, 2, 3, 4, 5]" "[3, 4, 5]"
    assert_success
    assert_output "superlist"
}

test_first_list_missing_element_from_second_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 3]" "[1, 2, 3]"
    assert_success
    assert_output "unequal"
}

test_second_list_missing_element_from_first_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[1, 3]"
    assert_success
    assert_output "unequal"
}

test_first_list_missing_additional_digits_from_second_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2]" "[1, 22]"
    assert_success
    assert_output "unequal"
}

test_order_matters_to_a_list() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 2, 3]" "[3, 2, 1]"
    assert_success
    assert_output "unequal"
}

test_same_digits_but_different_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash sublist.sh "[1, 0, 1]" "[10, 1]"
    assert_success
    assert_output "unequal"
}
