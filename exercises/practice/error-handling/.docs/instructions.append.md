# Dummy header

## Bash-specific instructions

The goal of this exercise is to consider the number of arguments passed to your program.
If there is exactly one argument, print a greeting message.
Otherwise print an error message and exit with a non-zero status.

## Requirements

- If the script receives **exactly one argument**, the expected output should be:
  ```
  Hello, <name>
  ```
  where `<name>` is the argument provided.

- If the script receives **any other number of arguments**, the expected output should be:
  ```
  Usage: error_handling.sh <person>
  ```
  and the script should exit with an error status.
