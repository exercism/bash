#!/usr/bin/env bats
load bats-extra

# local version: 2.3.0.0

# Test creation of Queens with invalid positions

queen_must_have_positive_row() { # @test
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w -2,2 -b 7,7
    assert_failure
    assert_output --partial "row not positive"
}

queen_must_have_row_on_board() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 8,4 -b 7,7
    assert_failure
    assert_output --partial "row not on board"
}

queen_must_have_positive_column() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 2,-2 -b 7,7
    assert_failure
    assert_output --partial "column not positive"
}

queen_must_have_column_on_board() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 4,8 -b 7,7
    assert_failure
    assert_output --partial "column not on board"
}

same_position() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 7,7 -b 7,7
    assert_failure
    assert_output --partial "same position"
}


# Test the ability of one queen to attack another

can_not_attack() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,4 -b 6,6
    assert_success 
    assert_output "false"
}

can_attack_on_same_row() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,4 -b 2,6
    assert_success 
    assert_output "true"
}

can_attack_on_same_column() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 4,5 -b 2,5
    assert_success 
    assert_output "true"
}

can_attack_on_first_diagonal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 0,4
    assert_success 
    assert_output "true"
}

can_attack_on_second_diagonal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 3,1
    assert_success 
    assert_output "true"
}

can_attack_on_third_diagonal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 1,1
    assert_success 
    assert_output "true"
}

can_attack_on_fourth_diagonal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 1,7 -b 0,6
    assert_success 
    assert_output "true"
}

cannot_attack_if_falling_diagonals_are_only_the_same_when_reflected_across_the_longest_falling_diagonal() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 4,1 -b 2,5
    assert_success 
    assert_output "false"
}
