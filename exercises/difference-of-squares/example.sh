#!/usr/bin/env bash

n=$1

sum_of_squares=0
almost_square_of_sum=0
for ((i=1; i<=n; i++))
do
    sum_of_squares=$(($sum_of_squares + $i**2))
    almost_square_of_sum=$(($almost_square_of_sum + $i))
done
square_of_sum=$(($almost_square_of_sum**2))
if [ $# -eq 2 ]
then
    if [ $2 == "-s" ]
    then
        echo "$sum_of_squares"
    elif [ $2 == "-S" ]
    then
        echo "$square_of_sum"
    fi
else
    echo $(($square_of_sum - $sum_of_squares))
fi

