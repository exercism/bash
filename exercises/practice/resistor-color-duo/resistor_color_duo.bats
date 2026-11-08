#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_brown_and_black() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh brown black
    assert_success
    assert_output "10"
}

test_blue_and_grey() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh blue grey
    assert_success
    assert_output "68"
}

test_yellow_and_violet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh yellow violet
    assert_success
    assert_output "47"
}

test_white_and_red() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh white red
    assert_success
    assert_output "92"
}

test_orange_and_orange() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh orange orange
    assert_success
    assert_output "33"
}

test_ignore_additional_colors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh green brown orange
    assert_success
    assert_output "51"
}

test_black_and_brown_one_digit() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh black brown
    assert_success
    assert_output "1"
}

test_invalid_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh foo
    assert_failure
    assert_output --partial "invalid color"
}

test_one_valid_color_and_one_invalid_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh blue foo
    assert_failure
    assert_output --partial "invalid color"
}

test_one_invalid_color_and_one_valid_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_duo.sh foo blue
    assert_failure
    assert_output --partial "invalid color"
}
