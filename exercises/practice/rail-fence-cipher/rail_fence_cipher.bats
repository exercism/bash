#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_encode_encode_with_two_rails() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 2 "XOXOXOXOXOXOXOXOXO"
    assert_success
    assert_output "XXXXXXXXXOOOOOOOOO"
}

test_encode_encode_with_three_rails() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 3 "WEAREDISCOVEREDFLEEATONCE"
    assert_success
    assert_output "WECRLTEERDSOEEFEAOCAIVDEN"
}

test_encode_encode_with_ending_in_the_middle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 4 "EXERCISES"
    assert_success
    assert_output "ESXIEECSR"
}

test_decode_decode_with_three_rails() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 3 "TEITELHDVLSNHDTISEIIEA"
    assert_success
    assert_output "THEDEVILISINTHEDETAILS"
}

test_decode_decode_with_five_rails() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 5 "EIEXMSMESAORIWSCE"
    assert_success
    assert_output "EXERCISMISAWESOME"
}

test_decode_decode_with_six_rails() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 6 "133714114238148966225439541018335470986172518171757571896261"
    assert_success
    assert_output "112358132134558914423337761098715972584418167651094617711286"
}

# Track specific tests

test_encode_with_more_rails_than_text () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 10 "hello"
    assert_success
    assert_output "hello"
}

test_decode_with_more_rails_than_text () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d 10 "hello"
    assert_success
    assert_output "hello"
}

test_decode_the_encoded_text_yields_the_original () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    plaintext="the quick brown fox jumped over the lazy dogs"
    rails=5
    run bash rail_fence_cipher.sh -e $rails "$plaintext"
    assert_success
    ciphertext=$output
    run bash rail_fence_cipher.sh -d $rails "$ciphertext"
    assert_success
    assert_output "$plaintext"
}

# Invocation errors

test_no_options () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh
    assert_failure
    assert_output    # there is _some_ output
}

test_zero_rails () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -e 0 abc
    assert_failure
    assert_output    # there is _some_ output
}

test_negative_rails () { #@test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rail_fence_cipher.sh -d -2 abc
    assert_failure
    assert_output    # there is _some_ output
}
