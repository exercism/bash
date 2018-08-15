# Affine Cipher

Create an implementation of the affine cipher,
an ancient encryption system created in the Middle East.

The affine cipher is a type of monoalphabetic substitution cipher.
Each character is mapped to its numeric equivalent, encrypted with
a mathematical function and then converted to the letter relating to
its new numeric value. Although all monoalphabetic ciphers are weak,
the affine cypher is much stronger than the atbash cipher,
because it has many more keys.

the encryption function is:

  `E(x) = (ax + b) mod m`
  -  where `x` is the letter's index from 0 - length of alphabet - 1
  -  `m` is the length of the alphabet. For the roman alphabet `m == 26`.
  -  and `a` and `b` make the key

the decryption function is:

  `D(y) = a^-1(y - b) mod m`
  -  where `y` is the numeric value of an encrypted letter, ie. `y = E(x)`
  -  it is important to note that `a^-1` is the modular multiplicative inverse
     of `a mod m`
  -  the modular multiplicative inverse of `a` only exists if `a` and `m` are
     coprime.

To find the MMI of `a`:

  `an mod m = 1`
  -  where `n` is the modular multiplicative inverse of `a mod m`

More information regarding how to find a Modular Multiplicative Inverse
and what it means can be found [here.](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse) 

Because automatic decryption fails if `a` is not coprime to `m` your
program should return status 1 and `"Error: a and m must be coprime."`
if they are not.  Otherwise it should encode or decode with the
provided key.

The Caesar (shift) cipher is a simple affine cipher where `a` is 1 and
`b` as the magnitude results in a static displacement of the letters.
This is much less secure than a full implementation of the affine cipher.

Ciphertext is written out in groups of fixed length, the traditional group
size being 5 letters, and punctuation is excluded. This is to make it
harder to guess things based on word boundaries.

## Examples

 - Encoding `test` gives `ybty` with the key a=5 b=7
 - Decoding `ybty` gives `test` with the key a=5 b=7
 - Decoding `ybty` gives `lqul` with the wrong key a=11 b=7
 - Decoding `kqlfd jzvgy tpaet icdhm rtwly kqlon ubstx`
   - gives `thequickbrownfoxjumpsoverthelazydog` with the key a=19 b=13
 - Encoding `test` with the key a=18 b=13
   - gives `Error: a and m must be coprime.`
   - because a and m are not relatively prime

### Examples of finding a Modular Multiplicative Inverse (MMI)

  - simple example:
    - `9 mod 26 = 9`
    - `9 * 3 mod 26 = 27 mod 26 = 1`
    - `3` is the MMI of `9 mod 26`
  - a more complicated example:
    - `15 mod 26 = 15`
    - `15 * 7 mod 26 = 105 mod 26 = 1`
    - `7` is the MMI of `15 mod 26`


Run the tests with:

```bash
bats affine_cipher_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

Wikipedia [http://en.wikipedia.org/wiki/Affine_cipher](http://en.wikipedia.org/wiki/Affine_cipher)


## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
