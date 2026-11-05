#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-05T22:35:31+00:00

function encode_encode_yes { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "yes"
    assert_success
    assert_output "bvh"
}

function encode_encode_no { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "no"
    assert_success
    assert_output "ml"
}

function encode_encode_omg { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "OMG"
    assert_success
    assert_output "lnt"
}

function encode_encode_spaces { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "O M G"
    assert_success
    assert_output "lnt"
}

function encode_encode_mindblowingly { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "mindblowingly"
    assert_success
    assert_output "nrmwy oldrm tob"
}

function encode_encode_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "Testing,1 2 3, testing."
    assert_success
    assert_output "gvhgr mt123 gvhgr mt"
}

function encode_encode_deep_thought { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "Truth is fiction."
    assert_success
    assert_output "gifgs rhurx grlm"
}

function encode_encode_all_the_letters { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh encode "The quick brown fox jumps over the lazy dog."
    assert_success
    assert_output "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
}

function decode_decode_exercism { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "vcvix rhn"
    assert_success
    assert_output "exercism"
}

function decode_decode_a_sentence { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    assert_success
    assert_output "anobstacleisoftenasteppingstone"
}

function decode_decode_numbers { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "gvhgr mt123 gvhgr mt"
    assert_success
    assert_output "testing123testing"
}

function decode_decode_all_the_letters { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    assert_success
    assert_output "thequickbrownfoxjumpsoverthelazydog"
}

function decode_decode_with_too_many_spaces { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "vc vix    r hn"
    assert_success
    assert_output "exercism"
}

function decode_decode_with_no_spaces { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash atbash_cipher.sh decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
    assert_success
    assert_output "anobstacleisoftenasteppingstone"
}
