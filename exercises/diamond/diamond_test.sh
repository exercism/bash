#!/usr/bin/env bash

# local version: 1.1.0.0

@test "Degenerate case with a single 'A' row" {
  #[[ $BATS_RUN_SKIPPED == true  ]] || skip
  expected="$(cat << EOT
A
EOT
)"
  run bash diamond.sh A
  (( status == 0 ))
  [[ $output == "$expected" ]]
}

@test "Degenerate case with no row containing 3 distinct groups of spaces" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  expected="$(cat << EOT
 A 
B B
 A 
EOT
)"
  run bash diamond.sh B
  (( status == 0 ))
  [[ $output == "$expected" ]]
}

@test "Smallest non-degenerate case with odd diamond side length" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  expected="$(cat << EOT
  A  
 B B 
C   C
 B B 
  A  
EOT
)"
  run bash diamond.sh C
  (( status == 0 ))
  [[ $output == "$expected" ]]
}

@test "Smallest non-degenerate case with even diamond side length" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
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
  (( status == 0 ))
  [[ $output == "$expected" ]]
}

@test "Largest possible diamond" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
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
  (( status == 0 ))
  [[ $output == "$expected" ]]
}

