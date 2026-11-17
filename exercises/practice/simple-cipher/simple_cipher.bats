#!/usr/bin/env bats
load bats-extra

# local version: 2.0.0.1
# bash-specific test: Input validation, lower-casing

# -- bats variables -- #
declare output

# Random key cipher"

test_can_generate_a_random_key() { # @test
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh key
    assert_success
    key=$output
    assert [ "${#key}" -ge 100 ]     # at least 100 chars
    [[ "$key" =~ ^[[:lower:]]+$ ]]   # only lowercase letters
}

test_can_encode_random() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh key
    assert_success
    key=$output
    plaintext="aaaaaaaaaa"
    run bash simple_cipher.sh -k "$key" encode "$plaintext"
    assert_success
    assert_equal "${#output}" 10
    assert_output "${key:0:10}"
}

test_can_decode_random() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh key
    assert_success
    key=$output
    plaintext="aaaaaaaaaa"
    run bash simple_cipher.sh -k "$key" decode "${key:0:10}"
    assert_success
    assert_equal "${#output}" 10
    assert_output "$plaintext"
}

test_is_reversible_random() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh key
    assert_success
    key=$output

    plaintext="abcdefghij"
    run bash simple_cipher.sh -k "$key" encode "$plaintext"
    assert_success
    encoded=$output

    run bash simple_cipher.sh -k "$key" decode "$encoded"
    assert_success
    assert_output "$plaintext"
}

# Substitution cipher

test_can_encode() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abcdefghij
    txt=aaaaaaaaaa
    run bash simple_cipher.sh -k "$key" encode "$txt"
    assert_success
    assert_output "$key"
}

test_can_decode() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abcdefghij
    txt=abcdefghij
    exp=aaaaaaaaaa
    run bash simple_cipher.sh -k "$key" decode "$txt"
    assert_success
    assert_output "$exp"
}

test_is_reversible() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abcdefghij
    txt=abcdefghij
    exp=abcdefghij
    run bash simple_cipher.sh -k "$key" encode "$txt"
    assert_success
    encoded=$output
    run bash simple_cipher.sh -k "$key" decode "$encoded"
    assert_success
    assert_output "$exp"
}

test_can_double_shift_encode() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=iamapandabear
    txt=iamapandabear
    exp=qayaeaagaciai
    run bash simple_cipher.sh -k "$key" encode "$txt"
    assert_success
    assert_output "$exp"
}

test_can_wrap_on_encode() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abcdefghij
    txt=zzzzzzzzzz
    exp=zabcdefghi
    run bash simple_cipher.sh -k "$key" encode "$txt"
    assert_success
    assert_output "$exp"
}

test_can_wrap_on_decode() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abcdefghij
    txt=zabcdefghi
    exp=zzzzzzzzzz
    run bash simple_cipher.sh -k "$key" decode "$txt"
    assert_success
    assert_output "$exp"
}

test_can_encode_messages_longer_than_the_key() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abc
    txt=iamapandabear
    exp=iboaqcnecbfcr
    run bash simple_cipher.sh -k "$key" encode "$txt"
    assert_success
    assert_output "$exp"
}

test_can_decode_messages_longer_than_the_key() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    key=abc
    txt=iboaqcnecbfcr
    exp=iamapandabear
    run bash simple_cipher.sh -k "$key" decode "$txt"
    assert_success
    assert_output "$exp"
}

test_plaintext_is_lowercased() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh -k b encode FOOBAR
    assert_success
    assert_output "gppcbs"
}

test_ciphertext_is_lowercased() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh -k b decode GPPCBS
    assert_success
    assert_output "foobar"
}

# errors

test_key_must_be_lowercase() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh -k ABC encode foo
    assert_failure
    assert_output --partial "invalid key"
}

test_key_must_be_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash simple_cipher.sh -k 123 encode foo
    assert_failure
    assert_output --partial "invalid key"
}
