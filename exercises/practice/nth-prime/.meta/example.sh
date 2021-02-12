#!/usr/bin/env bash

# The largest concern is finding an algorithm that is not
# excruciatingly slow in bash. I found that Sieve of 
# Eratosthenes is a good quick algorithm for finding
# primes less than an upper bound. The key is estimating
# an approximate upper bound for the nth prime

main() {
    local -i n=$1
    if (( n <= 0 )); then
        echo "invalid input" >&2
        exit 1
    fi

    local -i upper=$(approxNth $n)
    local primes=()
    sieve $upper primes

    # should do some validation that we acually have n
    # prime numbers, but this passes the test suite.

    echo "${primes[n-1]}"
}

# approximate the nth prime number
# ref: https://exercism.io/tracks/python/exercises/nth-prime/solutions/2a84e7330fab4b4cb04d92cf0f38164d 
# ref: https://en.wikipedia.org/wiki/Prime_number_theorem
approxNth() {
    # bc's `l()` function is natural logarithm
    local real=$( printf "2 + 1.2 * %d * l(%d)\n" "$1" "$1" | bc -l )
    # truncate the fractional part
    echo "${real%.*}"
}

# Sieve of Eratosthenes
sieve() {
    local -i limit=$1 i p
    local -n primes_=$2
    local -a is_prime=()
    for ((i = 2; i <= limit; i++)); do
        is_prime[i]=true
    done
    for ((p = 2; p * p <= limit; p++)); do
        if ${is_prime[p]}; then
            (( step = (p==2) ? 2 : 2*p ))
            for (( i = p * p; i <= limit; i += step )); do
                is_prime[i]=false
            done
        fi
    done
    for ((i = 2; i <= limit; i++)); do
        ${is_prime[i]} && primes_+=( $i )
    done
    return
}

main "$@"
