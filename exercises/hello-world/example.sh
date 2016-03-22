#!/bin/bash

if [ "$#" -eq 0 ]; then
  greeter="World"
else
  greeter="$@"
fi

echo "Hello, $greeter!"
