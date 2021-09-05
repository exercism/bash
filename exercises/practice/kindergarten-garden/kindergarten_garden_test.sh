#!/usr/bin/env bash
load bats-extra

# local version: 1.1.1.0

# Note: using ANSI-C Quoting here
# see https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting

# partial garden

@test "garden with single student" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'RC\nGG' "Alice"
    assert_success
    assert_output "radishes clover grass grass"
}

@test "different garden with single student" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VC\nRC' "Alice"
    assert_success
    assert_output "violets clover radishes clover"
}

@test "garden with two students" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCG\nVVRC' "Bob"
    assert_success
    assert_output "clover grass radishes clover"
}

@test "three students, second student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Bob"
    assert_success
    assert_output "clover clover clover clover"
}
            
@test "three students, third student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Charlie"
    assert_success
    assert_output "grass grass grass grass"
}

# full garden

@test "for Alice, first student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Alice"
    assert_success
    assert_output "violets radishes violets radishes"
}

@test "for Bob, second student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Bob"
    assert_success
    assert_output "clover grass clover clover"
}

@test "for Charlie" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Charlie"
    assert_success
    assert_output "violets violets clover grass"
}

@test "for David" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "David"
    assert_success
    assert_output "radishes violets clover radishes"
}

@test "for Eve" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Eve"
    assert_success
    assert_output "clover grass radishes grass"
}

@test "for Fred" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Fred"
    assert_success
    assert_output "grass clover violets clover"
}

@test "for Ginny" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Ginny"
    assert_success
    assert_output "clover grass grass clover"
}

@test "for Harriet" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Harriet"
    assert_success
    assert_output "violets radishes radishes violets"
}

@test "for Ileana" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Ileana"
    assert_success
    assert_output "grass clover violets clover"
}

@test "for Joseph" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Joseph"
    assert_success
    assert_output "violets clover violets grass"
}

@test "for Kincaid, second to last student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Kincaid"
    assert_success
    assert_output "grass clover clover grass"
}

@test "for Larry, last student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Larry"
    assert_success
    assert_output "grass violets clover violets"
}
