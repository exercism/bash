#!/usr/bin/env bats
load bats-extra

# local version: 2.3.0.0

# Test creation of Queens with invalid positions

@test "queen must have positive row" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w -2,2 -b 7,7
    assert_failure
    assert_output --partial "row not positive"
}

@test "queen must have row on board" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 8,4 -b 7,7
    assert_failure
    assert_output --partial "row not on board"
}

@test "queen must have positive column" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 2,-2 -b 7,7
    assert_failure
    assert_output --partial "column not positive"
}

@test "queen must have column on board" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 4,8 -b 7,7
    assert_failure
    assert_output --partial "column not on board"
}

@test "same position" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run  bash queen_attack.sh -w 7,7 -b 7,7
    assert_failure
    assert_output --partial "same position"
}


# Test the ability of one queen to attack another

@test "can not attack" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,4 -b 6,6
    assert_success 
    assert_output "false"
}

@test "can attack on same row" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,4 -b 2,6
    assert_success 
    assert_output "true"
}

@test "can attack on same column" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 4,5 -b 2,5
    assert_success 
    assert_output "true"
}

@test "can attack on first diagonal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 0,4
    assert_success 
    assert_output "true"
}

@test "can attack on second diagonal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 3,1
    assert_success 
    assert_output "true"
}

@test "can attack on third diagonal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 2,2 -b 1,1
    assert_success 
    assert_output "true"
}

@test "can attack on fourth diagonal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 1,7 -b 0,6
    assert_success 
    assert_output "true"
}

@test "cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash queen_attack.sh -w 4,1 -b 2,5
    assert_success 
    assert_output "false"
}
