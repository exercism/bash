#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:35:31+00:00

function testing_for_eggs_allergy_not_allergic_to_anything { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to eggs

    assert_success
    assert_output "false"
}

function testing_for_eggs_allergy_allergic_only_to_eggs { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 1 allergic_to eggs

    assert_success
    assert_output "true"
}

function testing_for_eggs_allergy_allergic_to_eggs_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 3 allergic_to eggs

    assert_success
    assert_output "true"
}

function testing_for_eggs_allergy_allergic_to_something_but_not_eggs { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 allergic_to eggs

    assert_success
    assert_output "false"
}

function testing_for_eggs_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to eggs

    assert_success
    assert_output "true"
}

function testing_for_peanuts_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to peanuts

    assert_success
    assert_output "false"
}

function testing_for_peanuts_allergy_allergic_only_to_peanuts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 allergic_to peanuts

    assert_success
    assert_output "true"
}

function testing_for_peanuts_allergy_allergic_to_peanuts_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 7 allergic_to peanuts

    assert_success
    assert_output "true"
}

function testing_for_peanuts_allergy_allergic_to_something_but_not_peanuts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 5 allergic_to peanuts

    assert_success
    assert_output "false"
}

function testing_for_peanuts_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to peanuts

    assert_success
    assert_output "true"
}

function testing_for_shellfish_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to shellfish

    assert_success
    assert_output "false"
}

function testing_for_shellfish_allergy_allergic_only_to_shellfish { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 4 allergic_to shellfish

    assert_success
    assert_output "true"
}

function testing_for_shellfish_allergy_allergic_to_shellfish_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 14 allergic_to shellfish

    assert_success
    assert_output "true"
}

function testing_for_shellfish_allergy_allergic_to_something_but_not_shellfish { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 10 allergic_to shellfish

    assert_success
    assert_output "false"
}

function testing_for_shellfish_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to shellfish

    assert_success
    assert_output "true"
}

function testing_for_strawberries_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to strawberries

    assert_success
    assert_output "false"
}

function testing_for_strawberries_allergy_allergic_only_to_strawberries { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 8 allergic_to strawberries

    assert_success
    assert_output "true"
}

function testing_for_strawberries_allergy_allergic_to_strawberries_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 28 allergic_to strawberries

    assert_success
    assert_output "true"
}

function testing_for_strawberries_allergy_allergic_to_something_but_not_strawberries { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 20 allergic_to strawberries

    assert_success
    assert_output "false"
}

function testing_for_strawberries_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to strawberries

    assert_success
    assert_output "true"
}

function testing_for_tomatoes_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to tomatoes

    assert_success
    assert_output "false"
}

function testing_for_tomatoes_allergy_allergic_only_to_tomatoes { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 16 allergic_to tomatoes

    assert_success
    assert_output "true"
}

function testing_for_tomatoes_allergy_allergic_to_tomatoes_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 56 allergic_to tomatoes

    assert_success
    assert_output "true"
}

function testing_for_tomatoes_allergy_allergic_to_something_but_not_tomatoes { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 40 allergic_to tomatoes

    assert_success
    assert_output "false"
}

function testing_for_tomatoes_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to tomatoes

    assert_success
    assert_output "true"
}

function testing_for_chocolate_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to chocolate

    assert_success
    assert_output "false"
}

function testing_for_chocolate_allergy_allergic_only_to_chocolate { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 32 allergic_to chocolate

    assert_success
    assert_output "true"
}

function testing_for_chocolate_allergy_allergic_to_chocolate_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 112 allergic_to chocolate

    assert_success
    assert_output "true"
}

function testing_for_chocolate_allergy_allergic_to_something_but_not_chocolate { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 80 allergic_to chocolate

    assert_success
    assert_output "false"
}

function testing_for_chocolate_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to chocolate

    assert_success
    assert_output "true"
}

function testing_for_pollen_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to pollen

    assert_success
    assert_output "false"
}

function testing_for_pollen_allergy_allergic_only_to_pollen { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 64 allergic_to pollen

    assert_success
    assert_output "true"
}

function testing_for_pollen_allergy_allergic_to_pollen_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 224 allergic_to pollen

    assert_success
    assert_output "true"
}

function testing_for_pollen_allergy_allergic_to_something_but_not_pollen { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 160 allergic_to pollen

    assert_success
    assert_output "false"
}

function testing_for_pollen_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to pollen

    assert_success
    assert_output "true"
}

function testing_for_cats_allergy_not_allergic_to_anything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 allergic_to cats

    assert_success
    assert_output "false"
}

function testing_for_cats_allergy_allergic_only_to_cats { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 128 allergic_to cats

    assert_success
    assert_output "true"
}

function testing_for_cats_allergy_allergic_to_cats_and_something_else { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 192 allergic_to cats

    assert_success
    assert_output "true"
}

function testing_for_cats_allergy_allergic_to_something_but_not_cats { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 64 allergic_to cats

    assert_success
    assert_output "false"
}

function testing_for_cats_allergy_allergic_to_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 allergic_to cats

    assert_success
    assert_output "true"
}

function list_when_no_allergies { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 0 list

    assert_success
    assert_output ""
}

function list_when_just_eggs { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 1 list

    assert_success
    assert_output "eggs"
}

function list_when_just_peanuts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 2 list

    assert_success
    assert_output "peanuts"
}

function list_when_just_strawberries { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 8 list

    assert_success
    assert_output "strawberries"
}

function list_when_eggs_and_peanuts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 3 list

    assert_success
    assert_output "eggs peanuts"
}

function list_when_more_than_eggs_but_not_peanuts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 5 list

    assert_success
    assert_output "eggs shellfish"
}

function list_when_lots_of_stuff { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 248 list

    assert_success
    assert_output "strawberries tomatoes chocolate pollen cats"
}

function list_when_everything { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 255 list

    assert_success
    assert_output "eggs peanuts shellfish strawberries tomatoes chocolate pollen cats"
}

function list_when_no_allergen_score_parts { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 509 list

    assert_success
    assert_output "eggs shellfish strawberries tomatoes chocolate pollen cats"
}

function list_when_no_allergen_score_parts_without_highest_valid_score { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash allergies.sh 257 list

    assert_success
    assert_output "eggs"
}
