# Diffie Hellman

Diffie-Hellman key exchange.

Alice and Bob use Diffie-Hellman key exchange to share secrets.  They
start with prime numbers, pick private keys, generate and share public
keys, and then generate a shared secret key.

## Step 0

The test program supplies prime numbers p and g.

## Step 1

Alice picks a private key, a, greater than 1 and less than p.  Bob does
the same to pick a private key b.

## Step 2

Alice calculates a public key A.

    A = g**a mod p

Using the same p and g, Bob similarly calculates a public key B from his
private key b.

## Step 3

Alice and Bob exchange public keys.  Alice calculates secret key s.

    s = B**a mod p

Bob calculates

    s = A**b mod p

The calculations produce the same result!  Alice and Bob now share
secret s.

Run the tests with:

```bash
bats diffie_hellman_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `[[ $BATS_RUN_SKIPPED == true  ]] || skip` annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats diffie_hellman_test.sh
```

## Source

Wikipedia, 1024 bit key from www.cryptopp.com/wiki. [http://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange](http://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange)


## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
