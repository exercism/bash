#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_yacht() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "yacht" 5 5 5 5 5
    assert_success
    assert_output "50"
}

test_not_yacht() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "yacht" 1 3 3 2 5
    assert_success
    assert_output "0"
}

test_ones() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "ones" 1 1 1 3 5
    assert_success
    assert_output "3"
}

test_ones_out_of_order() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "ones" 3 1 1 5 1
    assert_success
    assert_output "3"
}

test_no_ones() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "ones" 4 3 6 5 5
    assert_success
    assert_output "0"
}

test_twos() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "twos" 2 3 4 5 6
    assert_success
    assert_output "2"
}

test_fours() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "fours" 1 4 1 4 1
    assert_success
    assert_output "8"
}

test_yacht_counted_as_threes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "threes" 3 3 3 3 3
    assert_success
    assert_output "15"
}

test_yacht_of_3s_counted_as_fives() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "fives" 3 3 3 3 3
    assert_success
    assert_output "0"
}

test_fives() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "fives" 1 5 3 5 3
    assert_success
    assert_output "10"
}

test_sixes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "sixes" 2 3 4 5 6
    assert_success
    assert_output "6"
}

test_full_house_two_small_three_big() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "full house" 2 2 4 4 4
    assert_success
    assert_output "16"
}

test_full_house_three_small_two_big() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "full house" 5 3 3 5 3
    assert_success
    assert_output "19"
}

test_two_pair_is_not_a_full_house() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "full house" 2 2 4 4 5
    assert_success
    assert_output "0"
}

test_four_of_a_kind_is_not_a_full_house() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "full house" 1 4 4 4 4
    assert_success
    assert_output "0"
}

test_yacht_is_not_a_full_house() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "full house" 2 2 2 2 2
    assert_success
    assert_output "0"
}

test_four_of_a_kind() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "four of a kind" 6 6 4 6 6
    assert_success
    assert_output "24"
}

test_yacht_can_be_scored_as_four_of_a_kind() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "four of a kind" 3 3 3 3 3
    assert_success
    assert_output "12"
}

test_full_house_is_not_four_of_a_kind() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "four of a kind" 3 3 3 5 5
    assert_success
    assert_output "0"
}

test_little_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "little straight" 3 5 4 1 2
    assert_success
    assert_output "30"
}

test_little_straight_as_big_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "big straight" 1 2 3 4 5
    assert_success
    assert_output "0"
}

test_four_in_order_but_not_a_little_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "little straight" 1 1 2 3 4
    assert_success
    assert_output "0"
}

test_no_pairs_but_not_a_little_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "little straight" 1 2 3 4 6
    assert_success
    assert_output "0"
}

test_minimum_is_1_maximum_is_5_but_not_a_little_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "little straight" 1 1 3 4 5
    assert_success
    assert_output "0"
}

test_big_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "big straight" 4 6 2 5 3
    assert_success
    assert_output "30"
}

test_big_straight_as_little_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "little straight" 6 5 4 3 2
    assert_success
    assert_output "0"
}

test_no_pairs_but_not_a_big_straight() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "big straight" 6 5 4 3 1
    assert_success
    assert_output "0"
}

test_choice() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "choice" 3 3 5 6 6
    assert_success
    assert_output "23"
}

test_yacht_as_choice() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash yacht.sh "choice" 2 2 2 2 2
    assert_success
    assert_output "10"
}
