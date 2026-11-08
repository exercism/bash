#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-07T00:51:50+00:00

test_cleans_the_number() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "(223) 456-7890"
    assert_success
    assert_output "2234567890"
}

test_cleans_numbers_with_dots() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "223.456.7890"
    assert_success
    assert_output "2234567890"
}

test_cleans_numbers_with_multiple_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "223 456   7890   "
    assert_success
    assert_output "2234567890"
}

test_invalid_when_9_digits() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "123456789"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_when_11_digits_does_not_start_with_a_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "22234567890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_valid_when_11_digits_and_starting_with_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "12234567890"
    assert_success
    assert_output "2234567890"
}

test_valid_when_11_digits_and_starting_with_1_even_with_punctuation() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "+1 (223) 456-7890"
    assert_success
    assert_output "2234567890"
}

test_invalid_when_more_than_11_digits() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "321234567890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_with_letters() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "523-abc-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_with_punctuations() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "523-@:!-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_area_code_starts_with_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "(023) 456-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_area_code_starts_with_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "(123) 456-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_exchange_code_starts_with_0() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "(223) 056-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_exchange_code_starts_with_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "(223) 156-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_area_code_starts_with_0_on_valid_11_digit_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "1 (023) 456-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_area_code_starts_with_1_on_valid_11_digit_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "1 (123) 456-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "1 (223) 056-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}

test_invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash phone_number.sh "1 (223) 156-7890"
    assert_failure
    assert_output "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
}
