#!/usr/bin/env bash

# Sieve of Eratosthenes

declare -i limit=$1

is_prime=()
for ((i=0; i<=limit; i++)); do
    is_prime[i]=true
done
is_prime[0]=false
is_prime[1]=false

primes=()
p=2
while ((p <= limit)); do
    if ${is_prime[p]}; then
        primes+=( $p )
        ((p==2)) && step=$p || step=$((p * 2))
        for (( i = p * p; i <= limit; i += step )); do
            is_prime[i]=false
        done
    fi
    ((p++))
done

echo "${primes[*]}"
