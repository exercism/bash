#!/usr/bin/env bats
load bats-extra

# local version: 0.0.1

test_correct_arguments() { # @test
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice

  assert_success
  assert_output "Hello, Alice"
}

test_one_long_argument() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh "Alice and Bob"

  assert_success
  assert_output "Hello, Alice and Bob"
}

test_incorrect_arguments() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice Bob

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

test_print_usage_banner_with_no_value_given() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

test_empty_argument() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh ""

  assert_success
  assert_output "Hello, "
}
