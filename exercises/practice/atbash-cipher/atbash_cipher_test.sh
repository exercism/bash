#!/usr/bin/env bash
load bats-extra.bash

# local version: 1.2.0.0

# encode

@test "encode yes" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "yes"
  assert_success
  assert_output "bvh"
}

@test "encode no" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "no"
  assert_success
  assert_output "ml"
}

@test "encode OMG" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "OMG"
  assert_success
  assert_output "lnt"
}

@test "encode spaces" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "O M G"
  assert_success
  assert_output "lnt"
}

@test "encode mindblowingly" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "mindblowingly"
  assert_success
  assert_output "nrmwy oldrm tob"
}

@test "encode numbers" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "Testing,1 2 3, testing."
  assert_success
  assert_output "gvhgr mt123 gvhgr mt"
}

@test "encode deep thought" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "Truth is fiction."
  assert_success
  assert_output "gifgs rhurx grlm"
}

@test "encode all the letters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh encode "The quick brown fox jumps over the lazy dog."
  assert_success
  assert_output "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
}

# decode

@test "decode exercism" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "vcvix rhn"
  assert_success
  assert_output "exercism"
}

@test "decode a sentence" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  assert_success
  assert_output "anobstacleisoftenasteppingstone"
}

@test "decode numbers" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "gvhgr mt123 gvhgr mt"
  assert_success
  assert_output "testing123testing"
}

@test "decode all the letters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  assert_success
  assert_output "thequickbrownfoxjumpsoverthelazydog"
}

@test "decode with too many spaces" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "vc vix    r hn"
  assert_success
  assert_output "exercism"
}

@test "decode with no spaces" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash atbash_cipher.sh decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  assert_success
  assert_output "anobstacleisoftenasteppingstone"
}

