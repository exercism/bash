#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_zero() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 0
    assert_success
    assert_output "zero"
}

test_one() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1
    assert_success
    assert_output "one"
}

test_fourteen() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 14
    assert_success
    assert_output "fourteen"
}

test_twenty() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 20
    assert_success
    assert_output "twenty"
}

test_twenty_two() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 22
    assert_success
    assert_output "twenty-two"
}

test_thirty() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 30
    assert_success
    assert_output "thirty"
}

test_ninety_nine() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 99
    assert_success
    assert_output "ninety-nine"
}

test_one_hundred() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 100
    assert_success
    assert_output "one hundred"
}

test_one_hundred_twenty_three() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 123
    assert_success
    assert_output "one hundred twenty-three"
}

test_two_hundred() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 200
    assert_success
    assert_output "two hundred"
}

test_nine_hundred_ninety_nine() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 999
    assert_success
    assert_output "nine hundred ninety-nine"
}

test_one_thousand() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1000
    assert_success
    assert_output "one thousand"
}

test_one_thousand_two_hundred_thirty_four() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1234
    assert_success
    assert_output "one thousand two hundred thirty-four"
}

test_one_million() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1000000
    assert_success
    assert_output "one million"
}

test_one_million_two_thousand_three_hundred_forty_five() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1002345
    assert_success
    assert_output "one million two thousand three hundred forty-five"
}

test_one_billion() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1000000000
    assert_success
    assert_output "one billion"
}

test_a_big_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 987654321123
    assert_success
    assert_output "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"
}

test_numbers_below_zero_are_out_of_range() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh -1
    assert_failure
    assert_output "input out of range"
}

test_numbers_above_999_999_999_999_are_out_of_range() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash say.sh 1000000000000
    assert_failure
    assert_output "input out of range"
}
