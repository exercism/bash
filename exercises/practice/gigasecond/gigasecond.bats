#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_date_only_specification_of_time() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash gigasecond.sh '2011-04-25'

    assert_success
    assert_output "2043-01-01T01:46:40"
}

test_second_test_for_date_only_specification_of_time() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash gigasecond.sh '1977-06-13'

    assert_success
    assert_output "2009-02-19T01:46:40"
}

test_third_test_for_date_only_specification_of_time() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash gigasecond.sh '1959-07-19'

    assert_success
    assert_output "1991-03-27T01:46:40"
}

test_full_time_specified() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash gigasecond.sh '2015-01-24T22:00:00'

    assert_success
    assert_output "2046-10-02T23:46:40"
}

test_full_time_with_day_roll_over() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash gigasecond.sh '2015-01-24T23:59:59'

    assert_success
    assert_output "2046-10-03T01:46:39"
}
