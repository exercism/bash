#!/usr/bin/env bash

# local version: 1.1.1.0

# Note: using ANSI-C Quoting here
# see https://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting

# partial garden

@test "garden with single student" {
    #[[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'RC\nGG' "Alice"
    [[ $status -eq 0 ]]
    [[ $output == "radishes clover grass grass" ]]
}

@test "different garden with single student" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VC\nRC' "Alice"
    [[ $status -eq 0 ]]
    [[ $output == "violets clover radishes clover" ]]
}

@test "garden with two students" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VVCG\nVVRC' "Bob"
    [[ $status -eq 0 ]]
    [[ $output == "clover grass radishes clover" ]]
}

@test "three students, second student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Bob"
    [[ $status -eq 0 ]]
    [[ $output == "clover clover clover clover" ]]
}
            
@test "three students, third student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VVCCGG\nVVCCGG' "Charlie"
    [[ $status -eq 0 ]]
    [[ $output == "grass grass grass grass" ]]
}

# full garden

@test "first student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Alice"
    [[ $status -eq 0 ]]
    [[ $output == "violets radishes violets radishes" ]]
}

@test "second student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Bob"
    [[ $status -eq 0 ]]
    [[ $output == "clover grass clover clover" ]]
}

@test "second to last student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Kincaid"
    [[ $status -eq 0 ]]
    [[ $output == "grass clover clover grass" ]]
}

@test "last student's garden" {
    [[ $BATS_RUN_SKIPPED = true ]] || skip
    run bash kindergarten_garden.sh $'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV' "Larry"
    [[ $status -eq 0 ]]
    [[ $output == "grass violets clover violets" ]]
}
