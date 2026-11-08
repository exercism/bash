#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_run_length_encode_a_string_empty_string() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    run bash run_length_encoding.sh encode ""
    assert_success
    assert_output "$expected"
}

test_run_length_encode_a_string_single_characters_only_are_encoded_without_count() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="XYZ"
    run bash run_length_encoding.sh encode "XYZ"
    assert_success
    assert_output "$expected"
}

test_run_length_encode_a_string_string_with_no_single_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2A3B4C"
    run bash run_length_encoding.sh encode "AABBBCCCC"
    assert_success
    assert_output "$expected"
}

test_run_length_encode_a_string_single_characters_mixed_with_repeated_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="12WB12W3B24WB"
    run bash run_length_encoding.sh encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    assert_success
    assert_output "$expected"
}

test_run_length_encode_a_string_multiple_whitespace_mixed_in_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2 hs2q q2w2 "
    run bash run_length_encoding.sh encode "  hsqq qww  "
    assert_success
    assert_output "$expected"
}

test_run_length_encode_a_string_lowercase_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="2a3b4c"
    run bash run_length_encoding.sh encode "aabbbcccc"
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_empty_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=""
    run bash run_length_encoding.sh decode ""
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_single_characters_only() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="XYZ"
    run bash run_length_encoding.sh decode "XYZ"
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_string_with_no_single_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="AABBBCCCC"
    run bash run_length_encoding.sh decode "2A3B4C"
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_single_characters_with_repeated_characters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    run bash run_length_encoding.sh decode "12WB12W3B24WB"
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_multiple_whitespace_mixed_in_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="  hsqq qww  "
    run bash run_length_encoding.sh decode "2 hs2q q2w2 "
    assert_success
    assert_output "$expected"
}

test_run_length_decode_a_string_lowercase_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="aabbbcccc"
    run bash run_length_encoding.sh decode "2a3b4c"
    assert_success
    assert_output "$expected"
}

test_encode_and_then_decode_encode_followed_by_decode_gives_original_string() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="zzz ZZ  zZ"
    run bash run_length_encoding.sh encode "zzz ZZ  zZ"
    assert_success
    encoded=$output
    run bash run_length_encoding.sh decode "$encoded"
    assert_success
    assert_output "$expected"
}
