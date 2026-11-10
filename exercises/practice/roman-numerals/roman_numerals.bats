#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_1_is_i() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 1
    assert_success
    assert_output "I"
}

test_2_is_ii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 2
    assert_success
    assert_output "II"
}

test_3_is_iii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 3
    assert_success
    assert_output "III"
}

test_4_is_iv() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 4
    assert_success
    assert_output "IV"
}

test_5_is_v() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 5
    assert_success
    assert_output "V"
}

test_6_is_vi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 6
    assert_success
    assert_output "VI"
}

test_9_is_ix() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 9
    assert_success
    assert_output "IX"
}

test_16_is_xvi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 16
    assert_success
    assert_output "XVI"
}

test_27_is_xxvii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 27
    assert_success
    assert_output "XXVII"
}

test_48_is_xlviii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 48
    assert_success
    assert_output "XLVIII"
}

test_49_is_xlix() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 49
    assert_success
    assert_output "XLIX"
}

test_59_is_lix() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 59
    assert_success
    assert_output "LIX"
}

test_66_is_lxvi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 66
    assert_success
    assert_output "LXVI"
}

test_93_is_xciii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 93
    assert_success
    assert_output "XCIII"
}

test_141_is_cxli() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 141
    assert_success
    assert_output "CXLI"
}

test_163_is_clxiii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 163
    assert_success
    assert_output "CLXIII"
}

test_166_is_clxvi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 166
    assert_success
    assert_output "CLXVI"
}

test_402_is_cdii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 402
    assert_success
    assert_output "CDII"
}

test_575_is_dlxxv() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 575
    assert_success
    assert_output "DLXXV"
}

test_666_is_dclxvi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 666
    assert_success
    assert_output "DCLXVI"
}

test_911_is_cmxi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 911
    assert_success
    assert_output "CMXI"
}

test_1024_is_mxxiv() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 1024
    assert_success
    assert_output "MXXIV"
}

test_1666_is_mdclxvi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 1666
    assert_success
    assert_output "MDCLXVI"
}

test_3000_is_mmm() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 3000
    assert_success
    assert_output "MMM"
}

test_3001_is_mmmi() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 3001
    assert_success
    assert_output "MMMI"
}

test_3888_is_mmmdccclxxxviii() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 3888
    assert_success
    assert_output "MMMDCCCLXXXVIII"
}

test_3999_is_mmmcmxcix() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash roman_numerals.sh 3999
    assert_success
    assert_output "MMMCMXCIX"
}
