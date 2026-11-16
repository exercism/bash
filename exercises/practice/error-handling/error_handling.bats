#!/usr/bin/env bats
load bats-extra

# local version: 0.0.1

correct_arguments() { # @test
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice

  assert_success
  assert_output "Hello, Alice"
}

one_long_argument() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh "Alice and Bob"

  assert_success
  assert_output "Hello, Alice and Bob"
}

incorrect_arguments() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh Alice Bob

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

print_usage_banner_with_no_value_given() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

empty_argument() { # @test
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash error_handling.sh ""

  assert_success
  assert_output "Hello, "
}
