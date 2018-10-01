#!/usr/bin/env bash

@test 'date only specificaion of time' {
  # this is used to skip the test
  # normally, we skip every test except for the first one
  # (the first one is always commented out)
  # this allows for a person to focus on solving a test at a time
  # you can comment out or delete the `skip` to run the test when ready
  #skip
  run bash gigasecond.sh '2011-04-25Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Thu Jan 1 01:46:40 UTC 2043' ]
}

@test 'second test for date only specification of time' {
  skip
  run bash gigasecond.sh '1977-06-13Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Thu Feb 19 01:46:40 UTC 2009' ]
}

@test 'third test for date only specification of time' {
  skip
  run bash gigasecond.sh '1959-07-19Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Wed Mar 27 01:46:40 UTC 1991' ]
}

@test 'full time specified' {
  skip
  run bash gigasecond.sh '2015-01-24 22:00:00Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Tue Oct 2 23:46:40 UTC 2046' ]
}

@test 'full time with day roll-over' {
  skip
  run bash gigasecond.sh '2015-01-24 23:59:59Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Wed Oct 3 01:46:39 UTC 2046' ]
}
