squareOfSum() {
    num=$1
    sum=0
    while test $num -gt 0
    do
        sum=$(( sum + num ))
        num=$(( num - 1 ))
    done
    echo $(( sum ** 2 ))
}

sumOfSquares() {
    num=$1
    sum=0
    while test $num -gt 0
    do
        sum=$(( sum + (num ** 2) ))
        num=$(( num - 1 ))
    done
    echo $sum 
}

differenceOfSquares() {
    num=$1
    sum_square=$(squareOfSum $num)
    square_sum=$(sumOfSquares $num)
    echo $(( sum_square - square_sum ))
}
