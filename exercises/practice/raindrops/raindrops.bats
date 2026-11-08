#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_the_sound_for_1_is_1() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 1
    assert_success
    assert_output "1"
}

test_the_sound_for_3_is_pling() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 3
    assert_success
    assert_output "Pling"
}

test_the_sound_for_5_is_plang() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 5
    assert_success
    assert_output "Plang"
}

test_the_sound_for_7_is_plong() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 7
    assert_success
    assert_output "Plong"
}

test_the_sound_for_6_is_pling_as_it_has_a_factor_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 6
    assert_success
    assert_output "Pling"
}

test_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 8
    assert_success
    assert_output "8"
}

test_the_sound_for_9_is_pling_as_it_has_a_factor_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 9
    assert_success
    assert_output "Pling"
}

test_the_sound_for_10_is_plang_as_it_has_a_factor_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 10
    assert_success
    assert_output "Plang"
}

test_the_sound_for_14_is_plong_as_it_has_a_factor_of_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 14
    assert_success
    assert_output "Plong"
}

test_the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 15
    assert_success
    assert_output "PlingPlang"
}

test_the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 21
    assert_success
    assert_output "PlingPlong"
}

test_the_sound_for_25_is_plang_as_it_has_a_factor_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 25
    assert_success
    assert_output "Plang"
}

test_the_sound_for_27_is_pling_as_it_has_a_factor_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 27
    assert_success
    assert_output "Pling"
}

test_the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 35
    assert_success
    assert_output "PlangPlong"
}

test_the_sound_for_49_is_plong_as_it_has_a_factor_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 49
    assert_success
    assert_output "Plong"
}

test_the_sound_for_52_is_52() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 52
    assert_success
    assert_output "52"
}

test_the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 105
    assert_success
    assert_output "PlingPlangPlong"
}

test_the_sound_for_3125_is_plang_as_it_has_a_factor_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash raindrops.sh 3125
    assert_success
    assert_output "Plang"
}
