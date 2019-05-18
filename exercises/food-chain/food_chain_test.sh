#!/usr/bin/env bash

@test 'fly' {
    #skip
    expected="I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 1 1
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}
 
@test 'spider' {
    skip
    expected="I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 2 2
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'bird' {
    skip
    expected="I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 3 3
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'cat' {
    skip
    expected="I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 4 4
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'dog' {
    skip
    expected="I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 5 5
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'goat' {
    skip
    expected="I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 6 6
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'cow' {
    skip
    expected="I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 7 7
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'horse' {
    skip
    expected="I know an old lady who swallowed a horse.
She's dead, of course!"
    run bash food_chain.sh 8 8
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'multiple_verses' {
    skip
    expected="I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 1 3
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'full_song' {
    skip
    expected="I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a horse.
She's dead, of course!"
    run bash food_chain.sh 1 8
    [[ $status -eq 0 ]]
    [[ $output == "$expected" ]]
}

@test 'no_arguments' {
    skip
    run bash food_chain.sh
    [[ $status -ne 0 ]]
    [[ $output == *"2 arguments expected"* ]]
}

@test 'too_many_arguments' {
    skip
    run bash food_chain.sh 1 2 3
    [[ $status -ne 0 ]]
    [[ $output == *"2 arguments expected"* ]]
}

@test 'wrong_order_arguments' {
    skip
    run bash food_chain.sh 8 1
    [[ $status -ne 0 ]]
    [[ $output = *"Start must be less than or equal to End"* ]]
}
