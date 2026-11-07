#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:21:37+00:00

test_degenerate_case_with_a_single_a_row() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="$(cat << EOT
A
EOT
)"
    run bash diamond.sh A
    assert_success
    assert_output "$expected"
}

test_degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="$(cat << EOT
 A 
B B
 A 
EOT
)"
    run bash diamond.sh B
    assert_success
    assert_output "$expected"
}

test_smallest_non_degenerate_case_with_odd_diamond_side_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="$(cat << EOT
  A  
 B B 
C   C
 B B 
  A  
EOT
)"
    run bash diamond.sh C
    assert_success
    assert_output "$expected"
}

test_smallest_non_degenerate_case_with_even_diamond_side_length() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="$(cat << EOT
   A   
  B B  
 C   C 
D     D
 C   C 
  B B  
   A   
EOT
)"
    run bash diamond.sh D
    assert_success
    assert_output "$expected"
}

test_largest_possible_diamond() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="$(cat << EOT
                         A                         
                        B B                        
                       C   C                       
                      D     D                      
                     E       E                     
                    F         F                    
                   G           G                   
                  H             H                  
                 I               I                 
                J                 J                
               K                   K               
              L                     L              
             M                       M             
            N                         N            
           O                           O           
          P                             P          
         Q                               Q         
        R                                 R        
       S                                   S       
      T                                     T      
     U                                       U     
    V                                         V    
   W                                           W   
  X                                             X  
 Y                                               Y 
Z                                                 Z
 Y                                               Y 
  X                                             X  
   W                                           W   
    V                                         V    
     U                                       U     
      T                                     T      
       S                                   S       
        R                                 R        
         Q                               Q         
          P                             P          
           O                           O           
            N                         N            
             M                       M             
              L                     L              
               K                   K               
                J                 J                
                 I               I                 
                  H             H                  
                   G           G                   
                    F         F                    
                     E       E                     
                      D     D                      
                       C   C                       
                        B B                        
                         A                         
EOT
)"
    run bash diamond.sh Z
    assert_success
    assert_output "$expected"
}
