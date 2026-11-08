#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_format_smallest_non_exceptional_ordinal_numeral_4() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Gianna" 4

    assert_success
    assert_output "Gianna, you are the 4th customer we serve today. Thank you!"
}

test_format_greatest_single_digit_non_exceptional_ordinal_numeral_9() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Maarten" 9

    assert_success
    assert_output "Maarten, you are the 9th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Petronila" 5

    assert_success
    assert_output "Petronila, you are the 5th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_6() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Attakullakulla" 6

    assert_success
    assert_output "Attakullakulla, you are the 6th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Kate" 7

    assert_success
    assert_output "Kate, you are the 7th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_8() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Maximiliano" 8

    assert_success
    assert_output "Maximiliano, you are the 8th customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Mary" 1

    assert_success
    assert_output "Mary, you are the 1st customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Haruto" 2

    assert_success
    assert_output "Haruto, you are the 2nd customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Henriette" 3

    assert_success
    assert_output "Henriette, you are the 3rd customer we serve today. Thank you!"
}

test_format_smallest_two_digit_non_exceptional_ordinal_numeral_10() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Alvarez" 10

    assert_success
    assert_output "Alvarez, you are the 10th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_11() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Jacqueline" 11

    assert_success
    assert_output "Jacqueline, you are the 11th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_12() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Juan" 12

    assert_success
    assert_output "Juan, you are the 12th customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_13() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Patricia" 13

    assert_success
    assert_output "Patricia, you are the 13th customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_21() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Washi" 21

    assert_success
    assert_output "Washi, you are the 21st customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_22_ending_in_nd_even_though_it_is_a_multiple_of_11() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Ingrid" 22

    assert_success
    assert_output "Ingrid, you are the 22nd customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_33_ending_in_rd_even_though_it_is_a_multiple_of_11() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Mario" 33

    assert_success
    assert_output "Mario, you are the 33rd customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_52_ending_in_nd_even_though_it_is_a_multiple_of_13() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Quentin" 52

    assert_success
    assert_output "Quentin, you are the 52nd customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_62() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Nayra" 62

    assert_success
    assert_output "Nayra, you are the 62nd customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_72_ending_in_nd_even_though_it_is_a_multiple_of_12() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Ugo" 72

    assert_success
    assert_output "Ugo, you are the 72nd customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_91_ending_in_st_even_though_it_is_a_multiple_of_13() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Boris" 91

    assert_success
    assert_output "Boris, you are the 91st customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "John" 100

    assert_success
    assert_output "John, you are the 100th customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_101() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Zeinab" 101

    assert_success
    assert_output "Zeinab, you are the 101st customer we serve today. Thank you!"
}

test_format_non_exceptional_ordinal_numeral_112() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Knud" 112

    assert_success
    assert_output "Knud, you are the 112th customer we serve today. Thank you!"
}

test_format_exceptional_ordinal_numeral_123() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Yma" 123

    assert_success
    assert_output "Yma, you are the 123rd customer we serve today. Thank you!"
}

test_format_large_number_972_ending_in_nd_even_though_it_is_a_multiple_of_12() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Elias" 972

    assert_success
    assert_output "Elias, you are the 972nd customer we serve today. Thank you!"
}
