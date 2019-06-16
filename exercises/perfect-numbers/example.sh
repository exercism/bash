#!/usr/bin/env bash

aliquot_sum() {
    local -i num=$1 sum

    # 1 is classified as "deficient"
    if ((num == 1)); then 
        sum=0
    else        
        sum=1
        local -i a=2 b
        while true; do
            b=$((num / a))

            # only need to loop up to sqrt(num)
            ((a > b)) && break

            if ((a * b == num)); then
                ((sum += a))
                ((a != b)) && ((sum += b))
            fi

            ((a++))
        done
    fi
    echo $sum
}

declare -i num=$1

if ((num <= 0)); then
    echo "Classification is only possible for natural numbers." >&2
    exit 1
fi

declare -i sum=$(aliquot_sum $num)

if   ((sum < num)); then echo deficient
elif ((sum > num)); then echo abundant
else                     echo perfect
fi
