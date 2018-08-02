# Nucleotide Count

Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.

The genetic language of every living thing on the planet is DNA.
DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.

Here is an analogy:
- twigs are to birds nests as
- nucleotides are to DNA as
- legos are to lego houses as
- words are to sentences as...


Run the tests with:

```bash
bats nucleotide_count_test.sh
```

After the first test(s) pass, continue by commenting out or removing the `skip` annotations prepending other tests.

## Source

The Calculating DNA Nucleotides_problem at Rosalind [http://rosalind.info/problems/dna/](http://rosalind.info/problems/dna/)


## External utilities
`Bash` is a language to write scripts that works closely with various system utilities,
like [`sed`](https://www.gnu.org/software/sed/), [`awk`](https://www.gnu.org/software/gawk/), [`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html) and even other programming languages, like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long as your solution is portable
between systems and does not require installing third party applications, feel free to use them to solve the exercise.

For an extra challenge, if you would like to have a better understanding of the language,
try to re-implement the solution in pure `Bash`, without using any external tools.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
