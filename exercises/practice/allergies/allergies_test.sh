#!/usr/bin/env bash
load bats-extra.bash

# local version: 2.0.0.0

@test 'no_allergies_means_not_allergic' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to peanuts
    assert_success 
    assert_output "false"
    run bash allergies.sh 0 allergic_to cats
    assert_success 
    assert_output "false"
    run bash allergies.sh 0 allergic_to strawberries
    assert_success 
    assert_output "false"
}

@test 'is_allergic_to_eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 1 allergic_to eggs
    assert_success
    assert_output "true"
}

@test 'allergic_to_eggs_in_addition_to_other_stuff' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 5 allergic_to eggs
    assert_success
    assert_output "true"
    run bash allergies.sh 5 allergic_to shellfish
    assert_success
    assert_output "true"
    run bash allergies.sh 5 allergic_to strawberries
    assert_success 
    assert_output "false"
}

@test 'allergic_to_strawberries_but_not_peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 9 allergic_to eggs
    assert_success
    assert_output "true"
    run bash allergies.sh 9 allergic_to peanuts
    assert_success 
    assert_output "false"
    run bash allergies.sh 9 allergic_to shellfish
    assert_success 
    assert_output "false"
    run bash allergies.sh 9 allergic_to strawberries
    assert_success
    assert_output "true"
}

@test 'no_allergies_at_all' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 0 list
    assert_success
    refute_output   # no output
}

@test 'allergic_to_just_eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 1 list
    assert_success
    assert_output "eggs"
}

@test 'allergic_to_just_peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 2 list
    assert_success
    assert_output "peanuts"
}

@test 'allergic_to_just_strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 8 list
    assert_success
    assert_output "strawberries"
}

@test 'allergic_to_eggs_and_peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 3 list
    assert_success
    assert_output "eggs peanuts"
}

@test 'allergic_to_more_than_eggs_but_not_peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 5 list
    assert_success
    assert_output "eggs shellfish"
}

@test 'allergic_to_lots_of_stuff' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 248 list
    assert_success
    assert_output "strawberries tomatoes chocolate pollen cats"
}

@test 'allergic_to_everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 255 list
    assert_success
    assert_output "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats"
}

@test 'ignore_non_allergen_score_parts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip 
    run bash allergies.sh 509 list
    assert_success
    assert_output "eggs shellfish strawberries tomatoes chocolate pollen cats"
}
