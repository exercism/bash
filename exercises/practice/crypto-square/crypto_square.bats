#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_empty_plaintext_results_in_an_empty_ciphertext() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh ""
    assert_success
    assert_output ""
}

test_normalization_results_in_empty_plaintext() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "... --- ..."
    assert_success
    assert_output ""
}

test_lowercase() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "A"
    assert_success
    assert_output "a"
}

test_remove_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "  b "
    assert_success
    assert_output "b"
}

test_remove_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "@1,%!"
    assert_success
    assert_output "1"
}

test_9_character_plaintext_results_in_3_chunks_of_3_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "This is fun!"
    assert_success
    assert_output "tsf hiu isn"
}

test_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "Chill out."
    assert_success
    assert_output "clu hlt io "
}

test_54_character_plaintext_results_in_8_chunks_the_last_two_with_trailing_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash crypto_square.sh "If man was meant to stay on the ground, god would have given us roots."
    assert_success
    assert_output "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
}
