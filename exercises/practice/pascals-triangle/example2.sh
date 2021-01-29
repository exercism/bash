#!/usr/bin/env bash

# A mathematical approach: each cell can be calculated
# independently: row n column k value is the binomial
# coefficient C(n,k) = n! / (k! * (n-k)!)
#
# This approach limits us to about 21 rows maximum, after
# that we get integer overflows calculating the factorial.
# This will also be much slower than the 2-D array approach.
#
# In order to effectively cache the factorials (which are
# expensive to calculcate repeatedly), we must avoid invoking
# the `binomialCoefficient` and `factorial` functions with
# command substitutions. Command substitution syntax adds
# a level of subshell, and variables set in subshells do not
# persist into the current shell, making caching impossible.

declare -A bcCache
declare -a factCache=( [0]=1 [1]=1 )
declare -i maxFactCached=1

main() {
    local -i n=$1 i
    local spaces
    for (( i = 1; i <= n; i++ )); do
        # print the leading spaces for this row
        printf "%*s" $((n - i)) ""

        row $i
    done
}

row() {
    local -i n=$1 k _n _k
    local -a row=()
    for (( k = 1; k <= n; k++ )); do
        _n=$(( n - 1 ))
        _k=$(( k - 1 ))
        binomialCoefficient $_n $_k
        row+=( ${bcCache[$_n,$_k]} )
    done
    echo "${row[*]}"
}

# does not return a value, merely populates the cache
binomialCoefficient() {
    local -i n=$1 k=$2
    local key="$n,$k"
    if (( k == 0 || n-k == 0 )); then
        bcCache[$key]=1
    elif (( k == 1 || n-k == 1 )); then
        bcCache[$key]=$n
    else
        # since n >= k, calling `factorial $n` will 
        # populate the factCache for `k` and `n-k`
        factorial $n

        bcCache[$key]=$(( 
            factCache[n] / (factCache[k] * factCache[n-k]) 
        ))
    fi
}

# does not return a value, merely populates the cache
factorial() {
    local -i n=$1
    if (( n > maxFactCached )); then
        local -i i f=${factCache[maxFactCached]}
        for (( i = maxFactCached + 1; i <= n; i++ )); do 
            (( f *= i ))
            factCache[i]=$f
        done
        maxFactCached=$n
    fi
}

main "$@"
