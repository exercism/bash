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

  E(x) = (ax + b) % m 
# where x is the letters' index from 0 - length of alphabet - 1 
# m is the length of the alphabet - roman alphabet = 26
# and a and b make the key

the decryption function is:

  D(y) = a^-1(y - b) % m
# where y is the numeric value of an encrypted letter, ie. y = E(x)
# it is important to note that a^-1 is the modal multiplicative inverse
# the modal multiplicative inverse of a only exists is a and m are
# coprime. 

To find the MMI of a:

  1 = an % m # where n is the modal multiplicative inverse of a mod m

Because automatice decryption, fails if a is not coprime to m your 
program should return status 1 and "Error: a and m must be coprime."
if they are not.  Otherwise it should encode or decode with the 
provided key.

The Caesar (shift) cipher is a simple affine cipher where a is 1 and
b as the magnitude results in a static displacement of the letters.  
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

Run the tests with:

```bash
bats affine_cipher_test.sh
```

After the first test(s) pass, continue by commenting out or removing 
the `skip` annotations prepending other tests.

NB. After the initial tests there are tests to check for piping text into
example.sh as well as test for taking a file as the text argument. These
features help make the program have a *nix feel to them.
Additionally, the program can be optimized by encrypting the alphabet and
using the pair to translate.  Good luck!

## Source

Wikipedia [http://en.wikipedia.org/wiki/Affine_cipher](http://en.wikipedia.org/wiki/Affine_cipher)

## Developement Credits

I, Guy Gastineau, must give credit to the developers of the original
atbash-cypher problem for this track. Much of the work they did has been
reused in this problem's README and test.sh file. I thank them and hope they
appreciate the work I ave put into this.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution 
so you can see how others have completed the exercise.