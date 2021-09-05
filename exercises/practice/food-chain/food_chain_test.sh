#!/usr/bin/env bash
load bats-extra

# local version: 2.1.0.0

@test 'fly' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 1 1
    assert_success
    assert_output "$expected"
}
 
@test 'spider' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 2 2
    assert_success
    assert_output "$expected"
}

@test 'bird' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 3 3
    assert_success
    assert_output "$expected"
}

@test 'cat' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 4 4
    assert_success
    assert_output "$expected"
}

@test 'dog' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 5 5
    assert_success
    assert_output "$expected"
}

@test 'goat' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 6 6
    assert_success
    assert_output "$expected"
}

@test 'cow' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
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
    assert_success
    assert_output "$expected"
}

@test 'horse' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a horse.
She's dead, of course!"
    run bash food_chain.sh 8 8
    assert_success
    assert_output "$expected"
}

@test 'multiple_verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
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
    assert_success
    assert_output "$expected"
}

@test 'full_song' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
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
    assert_success
    assert_output "$expected"
}

@test 'no_arguments' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh
    assert_failure
    assert_output --partial "2 arguments expected"
}

@test 'too_many_arguments' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh 1 2 3
    assert_failure
    assert_output --partial "2 arguments expected"
}

@test 'wrong_order_arguments' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh 8 1
    assert_failure
    assert_output --partial "Start must be less than or equal to End"
}
