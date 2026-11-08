#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_orange_and_orange_and_black() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "orange" "orange" "black"
    assert_success
    assert_output "33 ohms"
}

test_blue_and_grey_and_brown() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "grey" "brown"
    assert_success
    assert_output "680 ohms"
}

test_red_and_black_and_red() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "red" "black" "red"
    assert_success
    assert_output "2 kiloohms"
}

test_green_and_brown_and_orange() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "green" "brown" "orange"
    assert_success
    assert_output "51 kiloohms"
}

test_yellow_and_violet_and_yellow() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "yellow" "violet" "yellow"
    assert_success
    assert_output "470 kiloohms"
}

test_blue_and_violet_and_blue() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "violet" "blue"
    assert_success
    assert_output "67 megaohms"
}

test_minimum_possible_value() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "black" "black" "black"
    assert_success
    assert_output "0 ohms"
}

test_maximum_possible_value() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "white"
    assert_success
    assert_output "99 gigaohms"
}

test_first_two_colors_make_an_invalid_octal_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "black" "grey" "black"
    assert_success
    assert_output "8 ohms"
}

test_ignore_extra_colors() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "blue" "green" "yellow" "orange"
    assert_success
    assert_output "650 kiloohms"
}


test_invalid_first_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "foo" "white" "white"
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_second_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "bar" "white"
    assert_failure
    assert_output    # there is _some_ output
}

test_invalid_third_color () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash resistor_color_trio.sh "white" "white" "baz"
    assert_failure
    assert_output    # there is _some_ output
}
