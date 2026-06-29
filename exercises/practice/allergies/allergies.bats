#!/usr/bin/env bats
load bats-extra

# generated on 2026-06-29T16:53:24+00:00

@test 'testing for eggs allergy:not allergic to anything' {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to eggs

    assert_success
    assert_output "false"
}

@test 'testing for eggs allergy:allergic only to eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 1 allergic_to eggs

    assert_success
    assert_output "true"
}

@test 'testing for eggs allergy:allergic to eggs and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 3 allergic_to eggs

    assert_success
    assert_output "true"
}

@test 'testing for eggs allergy:allergic to something, but not eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 allergic_to eggs

    assert_success
    assert_output "false"
}

@test 'testing for eggs allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to eggs

    assert_success
    assert_output "true"
}

@test 'testing for peanuts allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to peanuts

    assert_success
    assert_output "false"
}

@test 'testing for peanuts allergy:allergic only to peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 allergic_to peanuts

    assert_success
    assert_output "true"
}

@test 'testing for peanuts allergy:allergic to peanuts and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 7 allergic_to peanuts

    assert_success
    assert_output "true"
}

@test 'testing for peanuts allergy:allergic to something, but not peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 5 allergic_to peanuts

    assert_success
    assert_output "false"
}

@test 'testing for peanuts allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to peanuts

    assert_success
    assert_output "true"
}

@test 'testing for shellfish allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to shellfish

    assert_success
    assert_output "false"
}

@test 'testing for shellfish allergy:allergic only to shellfish' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 4 allergic_to shellfish

    assert_success
    assert_output "true"
}

@test 'testing for shellfish allergy:allergic to shellfish and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 14 allergic_to shellfish

    assert_success
    assert_output "true"
}

@test 'testing for shellfish allergy:allergic to something, but not shellfish' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 10 allergic_to shellfish

    assert_success
    assert_output "false"
}

@test 'testing for shellfish allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to shellfish

    assert_success
    assert_output "true"
}

@test 'testing for strawberries allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to strawberries

    assert_success
    assert_output "false"
}

@test 'testing for strawberries allergy:allergic only to strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 8 allergic_to strawberries

    assert_success
    assert_output "true"
}

@test 'testing for strawberries allergy:allergic to strawberries and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 28 allergic_to strawberries

    assert_success
    assert_output "true"
}

@test 'testing for strawberries allergy:allergic to something, but not strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 20 allergic_to strawberries

    assert_success
    assert_output "false"
}

@test 'testing for strawberries allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to strawberries

    assert_success
    assert_output "true"
}

@test 'testing for tomatoes allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to tomatoes

    assert_success
    assert_output "false"
}

@test 'testing for tomatoes allergy:allergic only to tomatoes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 16 allergic_to tomatoes

    assert_success
    assert_output "true"
}

@test 'testing for tomatoes allergy:allergic to tomatoes and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 56 allergic_to tomatoes

    assert_success
    assert_output "true"
}

@test 'testing for tomatoes allergy:allergic to something, but not tomatoes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 40 allergic_to tomatoes

    assert_success
    assert_output "false"
}

@test 'testing for tomatoes allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to tomatoes

    assert_success
    assert_output "true"
}

@test 'testing for chocolate allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to chocolate

    assert_success
    assert_output "false"
}

@test 'testing for chocolate allergy:allergic only to chocolate' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 32 allergic_to chocolate

    assert_success
    assert_output "true"
}

@test 'testing for chocolate allergy:allergic to chocolate and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 112 allergic_to chocolate

    assert_success
    assert_output "true"
}

@test 'testing for chocolate allergy:allergic to something, but not chocolate' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 80 allergic_to chocolate

    assert_success
    assert_output "false"
}

@test 'testing for chocolate allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to chocolate

    assert_success
    assert_output "true"
}

@test 'testing for pollen allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to pollen

    assert_success
    assert_output "false"
}

@test 'testing for pollen allergy:allergic only to pollen' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 64 allergic_to pollen

    assert_success
    assert_output "true"
}

@test 'testing for pollen allergy:allergic to pollen and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 224 allergic_to pollen

    assert_success
    assert_output "true"
}

@test 'testing for pollen allergy:allergic to something, but not pollen' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 160 allergic_to pollen

    assert_success
    assert_output "false"
}

@test 'testing for pollen allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to pollen

    assert_success
    assert_output "true"
}

@test 'testing for cats allergy:not allergic to anything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to cats

    assert_success
    assert_output "false"
}

@test 'testing for cats allergy:allergic only to cats' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 128 allergic_to cats

    assert_success
    assert_output "true"
}

@test 'testing for cats allergy:allergic to cats and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 192 allergic_to cats

    assert_success
    assert_output "true"
}

@test 'testing for cats allergy:allergic to something, but not cats' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 64 allergic_to cats

    assert_success
    assert_output "false"
}

@test 'testing for cats allergy:allergic to everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to cats

    assert_success
    assert_output "true"
}

@test 'list when::no allergies' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 list

    assert_success
    assert_output ""
}

@test 'list when::just eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 1 list

    assert_success
    assert_output "eggs"
}

@test 'list when::just peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 list

    assert_success
    assert_output "peanuts"
}

@test 'list when::just strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 8 list

    assert_success
    assert_output "strawberries"
}

@test 'list when::eggs and peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 3 list

    assert_success
    assert_output "eggs peanuts"
}

@test 'list when::more than eggs but not peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 5 list

    assert_success
    assert_output "eggs shellfish"
}

@test 'list when::lots of stuff' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 248 list

    assert_success
    assert_output "strawberries tomatoes chocolate pollen cats"
}

@test 'list when::everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 list

    assert_success
    assert_output "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats"
}

@test 'list when::no allergen score parts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 509 list

    assert_success
    assert_output "eggs shellfish strawberries tomatoes chocolate pollen cats"
}

@test 'list when::no allergen score parts without highest valid score' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 257 list

    assert_success
    assert_output "eggs"
}
