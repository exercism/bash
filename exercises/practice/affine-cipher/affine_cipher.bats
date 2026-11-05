#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:35:31+00:00

function encode_encode_yes { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 5 7 "yes"
    assert_success
    assert_output "xbt"
}

function encode_encode_no { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 15 18 "no"
    assert_success
    assert_output "fu"
}

function encode_encode_omg { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 21 3 "OMG"
    assert_success
    assert_output "lvz"
}

function encode_encode_o_m_g { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 25 47 "O M G"
    assert_success
    assert_output "hjp"
}

function encode_encode_mindblowingly { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 11 15 "mindblowingly"
    assert_success
    assert_output "rzcwa gnxzc dgt"
}

function encode_encode_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 3 4 "Testing,1 2 3, testing."
    assert_success
    assert_output "jqgjc rw123 jqgjc rw"
}

function encode_encode_deep_thought { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 5 17 "Truth is fiction."
    assert_success
    assert_output "iynia fdqfb ifje"
}

function encode_encode_all_the_letters { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 17 33 "The quick brown fox jumps over the lazy dog."
    assert_success
    assert_output "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
}

function encode_encode_with_a_not_coprime_to_m { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh encode 6 17 "This is a test."
    assert_failure
    assert_output "a and m must be coprime."
}

function decode_decode_exercism { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 3 7 "tytgn fjr"
    assert_success
    assert_output "exercism"
}

function decode_decode_a_sentence { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 19 16 "qdwju nqcro muwhn odqun oppmd aunwd o"
    assert_success
    assert_output "anobstacleisoftenasteppingstone"
}

function decode_decode_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 25 7 "odpoz ub123 odpoz ub"
    assert_success
    assert_output "testing123testing"
}

function decode_decode_all_the_letters { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 17 33 "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
    assert_success
    assert_output "thequickbrownfoxjumpsoverthelazydog"
}

function decode_decode_with_no_spaces_in_input { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 17 33 "swxtjnpvyklruoliejdcblaxkswxmhqzglf"
    assert_success
    assert_output "thequickbrownfoxjumpsoverthelazydog"
}

function decode_decode_with_too_many_spaces { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 15 16 "vszzm    cly   yd cg    qdp"
    assert_success
    assert_output "jollygreengiant"
}

function decode_decode_with_a_not_coprime_to_m { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash affine_cipher.sh decode 13 5 "Test"
    assert_failure
    assert_output "a and m must be coprime."
}
