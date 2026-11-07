#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

# Note: using ANSI-C Quoting here
# see https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting

test_partial_garden_garden_with_single_student() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'RC\nGG' "Alice"
    assert_success
    assert_output "radishes clover grass grass"
}

test_partial_garden_different_garden_with_single_student() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VC\nRC' "Alice"
    assert_success
    assert_output "violets clover radishes clover"
}

test_partial_garden_garden_with_two_students() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCG\nVVRC' "Bob"
    assert_success
    assert_output "clover grass radishes clover"
}

test_partial_garden_multiple_students_for_the_same_garden_with_three_students_second_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Bob"
    assert_success
    assert_output "clover clover clover clover"
}

test_partial_garden_multiple_students_for_the_same_garden_with_three_students_third_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Charlie"
    assert_success
    assert_output "grass grass grass grass"
}

test_full_garden_for_alice_first_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Alice"
    assert_success
    assert_output "violets radishes violets radishes"
}

test_full_garden_for_bob_second_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Bob"
    assert_success
    assert_output "clover grass clover clover"
}

test_full_garden_for_charlie() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Charlie"
    assert_success
    assert_output "violets violets clover grass"
}

test_full_garden_for_david() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "David"
    assert_success
    assert_output "radishes violets clover radishes"
}

test_full_garden_for_eve() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Eve"
    assert_success
    assert_output "clover grass radishes grass"
}

test_full_garden_for_fred() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Fred"
    assert_success
    assert_output "grass clover violets clover"
}

test_full_garden_for_ginny() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Ginny"
    assert_success
    assert_output "clover grass grass clover"
}

test_full_garden_for_harriet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Harriet"
    assert_success
    assert_output "violets radishes radishes violets"
}

test_full_garden_for_ileana() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Ileana"
    assert_success
    assert_output "grass clover violets clover"
}

test_full_garden_for_joseph() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Joseph"
    assert_success
    assert_output "violets clover violets grass"
}

test_full_garden_for_kincaid_second_to_last_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Kincaid"
    assert_success
    assert_output "grass clover clover grass"
}

test_full_garden_for_larry_last_student_s_garden() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Larry"
    assert_success
    assert_output "grass violets clover violets"
}
