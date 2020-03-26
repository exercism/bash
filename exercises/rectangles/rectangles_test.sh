#!/usr/bin/env bash

# local version: 1.1.0.0

# The rectangles.sh script will read the input from stdin.

@test "no rows" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh
    (( status == 0 ))
    [[ $output == "0" ]]
}

@test "no columns" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<<""
    (( status == 0 ))
    [[ $output == "0" ]]
}

@test "no rectangles" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<<" "
    (( status == 0 ))
    [[ $output == "0" ]]
}

@test "one rectangle" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+-+
| |
+-+
INPUT
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "two rectangles without shared parts" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
  | |
+-+-+
| |  
+-+  
INPUT
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "five rectangles with shared parts" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
  | |
+-+-+
| | |
+-+-+
INPUT
    (( status == 0 ))
    [[ $output == "5" ]]
}

@test "rectangle of height 1 is counted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+--+
+--+
INPUT
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "rectangle of width 1 is counted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
++
||
++
INPUT
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "1x1 square is counted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
++
++
INPUT
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "only complete rectangles are counted" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
    |
+-+-+
| | -
+-+-+
INPUT
    (( status == 0 ))
    [[ $output == "1" ]]
}

@test "rectangles can be of different sizes" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+------+----+
|      |    |
+---+--+    |
|   |       |
+---+-------+
INPUT
    (( status == 0 ))
    [[ $output == "3" ]]
}

@test "corner is required for a rectangle to be complete" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+------+----+
|      |    |
+------+    |
|   |       |
+---+-------+
INPUT
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "large input with many rectangles" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+---+--+----+
|   +--+----+
+---+--+    |
|   +--+----+
+---+--+--+-+
+---+--+--+-+
+------+  | |
          +-+
INPUT
    (( status == 0 ))
    [[ $output == "60" ]]
}

@test "nested rectangles" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+-----------+
|           |
|      +-+  |
|      +-+  |
+-----------+
INPUT
    (( status == 0 ))
    [[ $output == "2" ]]
}

@test "side by side rectangles" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+------+ +--+
|      | |  |
+------+ |  |
         |  |
         +--+
INPUT
    (( status == 0 ))
    [[ $output == "2" ]]
}
