# Instructions

Implement various kinds of error handling and resource management.

An important point of programming is how to handle errors and close
resources even if errors occur.

This exercise requires you to handle various errors. Because error handling
is rather programming language specific you'll have to refer to the tests
for your track to see what's exactly required.

## What you need to do

Implement a script that accepts exactly 1 argument and prints `Hello, <argument>`. If number of arguments is not equals 1, print usage info - `Usage: error_handling.sh <person>` and return non-zero exit code

Examples:

```
Input: person1
Expected output: Hello, person1
Expected exit code: 0
```

```
Input: person1 person2
Expected output: Usage: error_handling.sh <person>
Expected exit code: not zero (e.g. 1)
```
