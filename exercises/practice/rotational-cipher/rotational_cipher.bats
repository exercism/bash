#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_rotate_a_by_0_same_output_as_input() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "a" 0
    assert_success
    assert_output "$expected"
}

test_rotate_a_by_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="b"
    run bash rotational_cipher.sh "a" 1
    assert_success
    assert_output "$expected"
}

test_rotate_a_by_26_same_output_as_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "a" 26
    assert_success
    assert_output "$expected"
}

test_rotate_m_by_13() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="z"
    run bash rotational_cipher.sh "m" 13
    assert_success
    assert_output "$expected"
}

test_rotate_n_by_13_with_wrap_around_alphabet() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="a"
    run bash rotational_cipher.sh "n" 13
    assert_success
    assert_output "$expected"
}

test_rotate_capital_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="TRL"
    run bash rotational_cipher.sh "OMG" 5
    assert_success
    assert_output "$expected"
}

test_rotate_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="T R L"
    run bash rotational_cipher.sh "O M G" 5
    assert_success
    assert_output "$expected"
}

test_rotate_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Xiwxmrk 1 2 3 xiwxmrk"
    run bash rotational_cipher.sh "Testing 1 2 3 testing" 4
    assert_success
    assert_output "$expected"
}

test_rotate_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Gzo'n zvo, Bmviyhv!"
    run bash rotational_cipher.sh "Let's eat, Grandma!" 21
    assert_success
    assert_output "$expected"
}

test_rotate_all_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    run bash rotational_cipher.sh "The quick brown fox jumps over the lazy dog." 13
    assert_success
    assert_output "$expected"
}
