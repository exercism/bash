#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-08T06:23:17+00:00

test_recognizes_0() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
| |
|_|
   
INPUT
    assert_success
    assert_output "0"
}

test_recognizes_1() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
   
  |
  |
   
INPUT
    assert_success
    assert_output "1"
}

test_unreadable_but_correctly_sized_inputs_return_() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
   
  _
  |
   
INPUT
    assert_success
    assert_output "?"
}

test_input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
| |
   
INPUT
    assert_failure
    assert_output "Number of input lines is not a multiple of four"
}

test_input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
    
   |
   |
    
INPUT
    assert_failure
    assert_output "Number of input columns is not a multiple of three"
}

test_recognizes_110101100() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
       _     _        _  _ 
  |  || |  || |  |  || || |
  |  ||_|  ||_|  |  ||_||_|
                           
INPUT
    assert_success
    assert_output "110101100"
}

test_garbled_numbers_in_a_string_are_replaced_with_() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
       _     _           _ 
  |  || |  || |     || || |
  |  | _|  ||_|  |  ||_||_|
                           
INPUT
    assert_success
    assert_output "11?10?1?0"
}

test_recognizes_2() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
 _|
|_ 
   
INPUT
    assert_success
    assert_output "2"
}

test_recognizes_3() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
 _|
 _|
   
INPUT
    assert_success
    assert_output "3"
}

test_recognizes_4() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
   
|_|
  |
   
INPUT
    assert_success
    assert_output "4"
}

test_recognizes_5() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
|_ 
 _|
   
INPUT
    assert_success
    assert_output "5"
}

test_recognizes_6() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
|_ 
|_|
   
INPUT
    assert_success
    assert_output "6"
}

test_recognizes_7() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
  |
  |
   
INPUT
    assert_success
    assert_output "7"
}

test_recognizes_8() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
|_|
|_|
   
INPUT
    assert_success
    assert_output "8"
}

test_recognizes_9() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
 _ 
|_|
 _|
   
INPUT
    assert_success
    assert_output "9"
}

test_recognizes_string_of_decimal_numbers() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
                              
INPUT
    assert_success
    assert_output "1234567890"
}

test_numbers_separated_by_empty_lines_are_recognized_lines_are_joined_by_commas() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh << INPUT
    _  _ 
  | _| _|
  ||_  _|
         
    _  _ 
|_||_ |_ 
  | _||_|
         
 _  _  _ 
  ||_||_|
  ||_| _|
         
INPUT
    assert_success
    assert_output "123,456,789"
}


test_no_input() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash ocr_numbers.sh
    assert_success
    assert_output ""
}
