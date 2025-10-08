#!/usr/bin/env bats
load bats-extra

@test "format smallest non-exceptional ordinal numeral 4" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Gianna" 4

    assert_success
    assert_output "Gianna, you are the 4th customer we serve today. Thank you!"
}

@test "format greatest single digit non-exceptional ordinal numeral 9" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Maarten" 9

    assert_success
    assert_output "Maarten, you are the 9th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 5" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Petronila" 5

    assert_success
    assert_output "Petronila, you are the 5th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 6" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Attakullakulla" 6

    assert_success
    assert_output "Attakullakulla, you are the 6th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 7" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Kate" 7

    assert_success
    assert_output "Kate, you are the 7th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 8" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Maximiliano" 8

    assert_success
    assert_output "Maximiliano, you are the 8th customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 1" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Mary" 1

    assert_success
    assert_output "Mary, you are the 1st customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 2" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Haruto" 2

    assert_success
    assert_output "Haruto, you are the 2nd customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 3" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Henriette" 3

    assert_success
    assert_output "Henriette, you are the 3rd customer we serve today. Thank you!"
}

@test "format smallest two digit non-exceptional ordinal numeral 10" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Alvarez" 10

    assert_success
    assert_output "Alvarez, you are the 10th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 11" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Jacqueline" 11

    assert_success
    assert_output "Jacqueline, you are the 11th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 12" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Juan" 12

    assert_success
    assert_output "Juan, you are the 12th customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 13" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Patricia" 13

    assert_success
    assert_output "Patricia, you are the 13th customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 21" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Washi" 21

    assert_success
    assert_output "Washi, you are the 21st customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 62" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Nayra" 62

    assert_success
    assert_output "Nayra, you are the 62nd customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 100" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "John" 100

    assert_success
    assert_output "John, you are the 100th customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 101" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Zeinab" 101

    assert_success
    assert_output "Zeinab, you are the 101st customer we serve today. Thank you!"
}

@test "format non-exceptional ordinal numeral 112" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Knud" 112

    assert_success
    assert_output "Knud, you are the 112th customer we serve today. Thank you!"
}

@test "format exceptional ordinal numeral 123" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash line_up.sh "Yma" 123

    assert_success
    assert_output "Yma, you are the 123rd customer we serve today. Thank you!"
}
