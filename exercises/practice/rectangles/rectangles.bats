#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:49:56+00:00

test_no_rows() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh
    assert_success
    assert_output "0"
}

test_no_columns() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<<""
    assert_success
    assert_output "0"
}

test_no_rectangles() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
 
INPUT
    assert_success
    assert_output "0"
}

test_one_rectangle() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+-+
| |
+-+
INPUT
    assert_success
    assert_output "1"
}

test_two_rectangles_without_shared_parts() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
  | |
+-+-+
| |  
+-+  
INPUT
    assert_success
    assert_output "2"
}

test_five_rectangles_with_shared_parts() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
  | |
+-+-+
| | |
+-+-+
INPUT
    assert_success
    assert_output "5"
}

test_rectangle_of_height_1_is_counted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+--+
+--+
INPUT
    assert_success
    assert_output "1"
}

test_rectangle_of_width_1_is_counted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
++
||
++
INPUT
    assert_success
    assert_output "1"
}

test_1x1_square_is_counted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
++
++
INPUT
    assert_success
    assert_output "1"
}

test_only_complete_rectangles_are_counted() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
  +-+
    |
+-+-+
| | -
+-+-+
INPUT
    assert_success
    assert_output "1"
}

test_rectangles_can_be_of_different_sizes() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+------+----+
|      |    |
+---+--+    |
|   |       |
+---+-------+
INPUT
    assert_success
    assert_output "3"
}

test_corner_is_required_for_a_rectangle_to_be_complete() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+------+----+
|      |    |
+------+    |
|   |       |
+---+-------+
INPUT
    assert_success
    assert_output "2"
}

test_large_input_with_many_rectangles() { # @test
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
    assert_success
    assert_output "60"
}

test_rectangles_must_have_four_sides() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash rectangles.sh <<INPUT
+-+ +-+
| | | |
+-+-+-+
  | |  
+-+-+-+
| | | |
+-+ +-+
INPUT
    assert_success
    assert_output "5"
}
