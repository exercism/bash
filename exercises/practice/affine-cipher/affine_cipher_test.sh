#!/usr/bin/env bash
load bats-extra.bash

# local version: 2.0.0.0

# encode

 @test "encode yes" {
  #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 5 7 "yes"
  assert_success
  assert_output "xbt"
}

 @test "encode no" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 15 18 "no"
  assert_success
  assert_output "fu"
}

 @test "encode OMG" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 21 3 "OMG"
  assert_success
  assert_output "lvz"
}

 @test "encode O M G" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 25 47 "O M G"
  assert_success
  assert_output "hjp"
}

 @test "encode mindblowingly" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 11 15 "mindblowingly"
  assert_success
  assert_output "rzcwa gnxzc dgt"
}

 @test "encode numbers" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 3 4 "Testing,1 2 3, testing."
  assert_success
  assert_output "jqgjc rw123 jqgjc rw"
}

 @test "encode deep thought" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 5 17 "Truth is fiction."
  assert_success
  assert_output "iynia fdqfb ifje"
}

 @test "encode all the letters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 17 33 "The quick brown fox jumps over the lazy dog."
  assert_success
  assert_output "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
}

 @test "encode with a not coprime to m" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh encode 6 17 "This is a test."
  assert_failure
  assert_output "a and m must be coprime."
}

# decode

 @test "decode exercism" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 3 7 "tytgn fjr"
  assert_success
  assert_output "exercism"
}

 @test "decode a sentence" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 19 16 "qdwju nqcro muwhn odqun oppmd aunwd o"
  assert_success
  assert_output "anobstacleisoftenasteppingstone"
}

 @test "decode numbers" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 25 7 "odpoz ub123 odpoz ub"
  assert_success
  assert_output "testing123testing"
}

 @test "decode all the letters" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 17 33 "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
  assert_success
  assert_output "thequickbrownfoxjumpsoverthelazydog"
}

 @test "decode with no spaces in input" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 17 33 "swxtjnpvyklruoliejdcblaxkswxmhqzglf"
  assert_success
  assert_output "thequickbrownfoxjumpsoverthelazydog"
}

 @test "decode with too many spaces" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 15 16 "vszzm    cly   yd cg    qdp"
  assert_success
  assert_output "jollygreengiant"
}

 @test "decode with a not coprime to m" {
  [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run bash affine_cipher.sh decode 13 5 "Test"
  assert_failure
  assert_output "a and m must be coprime."
}
