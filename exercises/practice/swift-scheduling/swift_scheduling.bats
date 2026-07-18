#!/usr/bin/env bats
load bats-extra

# generated on 2026-07-18T06:41:40+00:00

@test "NOW translates to two hours later" {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "NOW" "2012-02-13T09:00:00"
  assert_success
  assert_output "2012-02-13T11:00:00"
}

@test "ASAP before one in the afternoon translates to today at five in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "ASAP" "1999-06-03T09:45:00"
  assert_success
  assert_output "1999-06-03T17:00:00"
}

@test "ASAP at one in the afternoon translates to tomorrow at one in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "ASAP" "2008-12-21T13:00:00"
  assert_success
  assert_output "2008-12-22T13:00:00"
}

@test "ASAP after one in the afternoon translates to tomorrow at one in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "ASAP" "2008-12-21T14:50:00"
  assert_success
  assert_output "2008-12-22T13:00:00"
}

@test "EOW on Monday translates to Friday at five in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "2025-02-03T16:00:00"
  assert_success
  assert_output "2025-02-07T17:00:00"
}

@test "EOW on Tuesday translates to Friday at five in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "1997-04-29T10:50:00"
  assert_success
  assert_output "1997-05-02T17:00:00"
}

@test "EOW on Wednesday translates to Friday at five in the afternoon" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "2005-09-14T11:00:00"
  assert_success
  assert_output "2005-09-16T17:00:00"
}

@test "EOW on Thursday translates to Sunday at eight in the evening" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "2011-05-19T08:30:00"
  assert_success
  assert_output "2011-05-22T20:00:00"
}

@test "EOW on Friday translates to Sunday at eight in the evening" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "2022-08-05T14:00:00"
  assert_success
  assert_output "2022-08-07T20:00:00"
}

@test "EOW translates to leap day" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "EOW" "2008-02-25T10:30:00"
  assert_success
  assert_output "2008-02-29T17:00:00"
}

@test "2M before the second month of this year translates to the first workday of the second month of this year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "2M" "2007-01-02T14:15:00"
  assert_success
  assert_output "2007-02-01T08:00:00"
}

@test "11M in the eleventh month translates to the first workday of the eleventh month of next year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "11M" "2013-11-21T15:30:00"
  assert_success
  assert_output "2014-11-03T08:00:00"
}

@test "4M in the ninth month translates to the first workday of the fourth month of next year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "4M" "2019-11-18T15:15:00"
  assert_success
  assert_output "2020-04-01T08:00:00"
}

@test "Q1 in the first quarter translates to the last workday of the first quarter of this year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "Q1" "2003-01-01T10:45:00"
  assert_success
  assert_output "2003-03-31T08:00:00"
}

@test "Q4 in the second quarter translates to the last workday of the fourth quarter of this year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "Q4" "2001-04-09T09:00:00"
  assert_success
  assert_output "2001-12-31T08:00:00"
}

@test "Q3 in the fourth quarter translates to the last workday of the third quarter of next year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "Q3" "2022-10-06T11:00:00"
  assert_success
  assert_output "2023-09-29T08:00:00"
}

@test "Q2 starting in the last month of the second quarter translates to the last workday of the second quarter of this year" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash swift_scheduling.sh "Q2" "2019-06-15T09:50:00"
  assert_success
  assert_output "2019-06-28T08:00:00"
}

