#!/usr/bin/env bats

# encode

@test "encode yes" {
  #skip
  run bash atbash_cipher.sh encode "yes"
  [ "$status" -eq 0 ]
  [ "$output" == "bvh" ]
}

@test "encode no" {
  skip
  run bash atbash_cipher.sh encode "no"
  [ "$status" -eq 0 ]
  [ "$output" == "ml" ]
}

@test "encode OMG" {
  skip
  run bash atbash_cipher.sh encode "OMG"
  [ "$status" -eq 0 ]
  [ "$output" == "lnt" ]
}

@test "encode spaces" {
  skip
  run bash atbash_cipher.sh encode "O M G"
  [ "$status" -eq 0 ]
  [ "$output" == "lnt" ]
}

@test "encode mindblowingly" {
  skip
  run bash atbash_cipher.sh encode "mindblowingly"
  [ "$status" -eq 0 ]
  [ "$output" == "nrmwy oldrm tob" ]
}

@test "encode numbers" {
  skip
  run bash atbash_cipher.sh encode "Testing,1 2 3, testing."
  [ "$status" -eq 0 ]
  [ "$output" == "gvhgr mt123 gvhgr mt" ]
}

@test "encode deep thought" {
  skip
  run bash atbash_cipher.sh encode "Truth is fiction."
  [ "$status" -eq 0 ]
  [ "$output" == "gifgs rhurx grlm" ]
}

@test "encode all the letters" {
  skip
  run bash atbash_cipher.sh encode "The quick brown fox jumps over the lazy dog."
  [ "$status" -eq 0 ]
  [ "$output" == "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" ]
}

# decode

@test "decode exercism" {
  skip
  run bash atbash_cipher.sh decode "vcvix rhn"
  [ "$status" -eq 0 ]
  [ "$output" == "exercism" ]
}

@test "decode a sentence" {
  skip
  run bash atbash_cipher.sh decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
  [ "$status" -eq 0 ]
  [ "$output" == "anobstacleisoftenasteppingstone" ]
}

@test "decode numbers" {
  skip
  run bash atbash_cipher.sh decode "gvhgr mt123 gvhgr mt"
  [ "$status" -eq 0 ]
  [ "$output" == "testing123testing" ]
}

@test "decode all the letters" {
  skip
  run bash atbash_cipher.sh decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
  [ "$status" -eq 0 ]
  [ "$output" == "thequickbrownfoxjumpsoverthelazydog" ]
}

@test "decode with too many spaces" {
  skip
  run bash atbash_cipher.sh decode "vc vix    r hn"
  [ "$status" -eq 0 ]
  [ "$output" == "exercism" ]
}

@test "decode with no spaces" {
  skip
  run bash atbash_cipher.sh decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
  [ "$status" -eq 0 ]
  [ "$output" == "anobstacleisoftenasteppingstone" ]
}

