#!/usr/bin/env bats

@test 'April 25th, 2011' {
  run bash gigasecond.sh '2011-04-25Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Thu Jan 1 01:46:40 UTC 2043' ]
}

@test 'June 13th, 1977' {
  skip
  run bash gigasecond.sh '1977-06-13Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Thu Feb 19 01:46:40 UTC 2009' ]
}

@test 'July 19th, 1959' {
  skip
  run bash gigasecond.sh '1959-07-19Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Wed Mar 27 01:46:40 UTC 1991' ]
}

@test 'Time specified' {
  skip
  run bash gigasecond.sh '2015-01-24 22:00:00Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Tue Oct 2 23:46:40 UTC 2046' ]
}

@test 'Time with day rollover' {
  skip
  run bash gigasecond.sh '2015-01-24 23:59:59Z'

  [ "$status" -eq 0 ]
  [ "$output" == 'Wed Oct 3 01:46:39 UTC 2046' ]
}
