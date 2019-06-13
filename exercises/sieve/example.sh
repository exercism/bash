#!/usr/bin/env bash

# Sieve of Eratosthenes

declare -i limit=$1

is_prime=()
for ((i = 2; i <= limit; i++)); do
    is_prime[i]=true
done

for ((p = 2; p <= limit; p++)); do
    # mark all multiples as not prime
    for (( m = 2 * p; m <= limit; m += p )); do
        is_prime[m]=false
    done
done

primes=()
for ((p = 2; p <= limit; p++)); do
    if ${is_prime[p]}; then
        primes+=( $p )
    fi
done

echo "${primes[*]}"
