#!/usr/bin/env bash

# Ensure your date calculations are done using UTC time zone

@test 'date only specificaion of time' {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash gigasecond.sh '2011-04-25'

  [[ $status -eq 0 ]]
  [[ $output == '2043-01-01T01:46:40' ]]
}

@test 'second test for date only specification of time' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash gigasecond.sh '1977-06-13'

  [[ $status -eq 0 ]]
  [[ $output == '2009-02-19T01:46:40' ]]
}

@test 'third test for date only specification of time' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash gigasecond.sh '1959-07-19'

  [[ $status -eq 0 ]]
  [[ $output == '1991-03-27T01:46:40' ]]
}

@test 'full time specified' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash gigasecond.sh '2015-01-24T22:00:00'

  [[ $status -eq 0 ]]
  [[ $output == '2046-10-02T23:46:40' ]]
}

@test 'full time with day roll-over' {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash gigasecond.sh '2015-01-24T23:59:59'

  [[ $status -eq 0 ]]
  [[ $output == '2046-10-03T01:46:39' ]]
}
