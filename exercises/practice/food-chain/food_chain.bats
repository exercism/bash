#!/usr/bin/env bats
load bats-extra

# generated on 2026-11-06T16:26:10+00:00

test_fly() { # @test
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 1 1
    assert_success
    assert_output "$expected"
}

test_spider() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die."
    run bash food_chain.sh 2 2
    assert_success
    assert_output "$expected"
}

test_bird() { # @test
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

test_cat() { # @test
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

test_dog() { # @test
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

test_goat() { # @test
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

test_cow() { # @test
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

test_horse() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected="I know an old lady who swallowed a horse.
She's dead, of course!"
    run bash food_chain.sh 8 8
    assert_success
    assert_output "$expected"
}

test_multiple_verses() { # @test
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

test_full_song() { # @test
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

test_no_arguments() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh
    assert_failure
    assert_output --partial "2 arguments expected"
}

test_too_many_arguments() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh 1 2 3
    assert_failure
    assert_output --partial "2 arguments expected"
}

test_wrong_order_arguments() { # @test
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run bash food_chain.sh 8 1
    assert_failure
    assert_output --partial "Start must be less than or equal to End"
}
