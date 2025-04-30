# About Here Documents

In Bash scripting, a "here document" (or "heredoc") redirects multiple lines of input to a command or program, as if you were typing them directly into the terminal.
It's a powerful tool for embedding multi-line text within your scripts without needing external files or complex string manipulation.

## Key Features and Syntax

1. Delimiter: a heredoc starts with the `<<` operator followed by a delimiter word (often called the "marker" or "terminator").
   This delimiter can be any word you choose, but it's common to use something like `EOF`, `END`, or `TEXT` for clarity.
   For more readable code, you can use something descriptive as the delimiter, for example `END_INSTALLATION_INSTRUCTIONS`.

1. Content: after the initial `<< DELIMITER`, you write the content you want to redirect.
   This can be multiple lines of text, code, or anything else.

1. Termination: the heredoc ends when the delimiter word appears again on a line by itself, with no leading or trailing whitespace.

## Basic Syntax

```bash
command << DELIMITER
  Content line 1
  Content line 2
  ...
  Content line N
DELIMITER
```

## How it Works

* Bash reads all the lines between the starting `<< DELIMITER` and the ending `DELIMITER`.
* Bash connects this content to the command's standard input.
* The command processes this input as if it were coming from the keyboard.

### Example 1: Simple Text Output

```bash
cat << EOF
This is the first line.
This is the second line.
This is the third line.
EOF
```

Output:

```plaintext
This is the first line.
This is the second line.
This is the third line.
```

In this example:

* `cat` is the command.
* `<< EOF` starts the heredoc with `EOF` as the delimiter.
* The three lines of text are the content.
* `EOF` on its own line ends the heredoc.
* `cat` then outputs the content it received.

### Example 2: Using with wc (Word Count)

```bash
wc -l << END
Line 1
Line 2
Line 3
END
```

Output:

```plaintext
3
```

Here, `wc -l` counts the number of lines.
The heredoc provides the three lines as input.

### Example 3: Passing data to a script

The script:

```bash
#!/usr/bin/env bash

# Script to process input
while IFS= read -r line; do
  echo "Processing: $line"
done
```

Call the script from an interactive bash prompt with a heredoc:

```bash
./your_script << MY_DATA
Item 1
Item 2
Item 3
MY_DATA
```

Output:

```plaintext
Processing: Item 1
Processing: Item 2
Processing: Item 3
```

## Variations and Advanced Features

### Literal Content

Bash performs variable expansion, command substitution, and arithmetic expansion within a heredoc.
In this sense, heredocs act like double quoted strings.

```bash
cat << EOF
The value of HOME is $HOME
The current date is $(date)
Two plus two is $((2 + 2))
EOF
```

Output:

```plaintext
The value of HOME is /home/glennj
The current date is Thu Apr 24 13:47:32 EDT 2025
Two plus two is 4
```

When the delimiter is quoting (using single or double quotes), these expansions are prevented.
The content is taken literally.
This is like single quoted strings.

```bash
cat << 'EOF'
The value of $HOME is not expanded here.
The result of $(date) is not executed.
Two plus two is calculated by $((2 + 2))
EOF
```

Output:

```plaintext
The value of $HOME is not expanded here.
The result of $(date) is not executed.
Two plus two is calculated by $((2 + 2))
```

### Stripping Leading Tabs

If you use `<<-` (with a trailing hyphen) instead of `<<`, Bash will strip any leading _tab characters_ from each line of the heredoc.
This is useful for indenting the heredoc content within your script without affecting the output.

```bash
# Note, the leading whitespace is tab characters only, not spaces!
# The ending delimiter can have leading tabs as well.
cat <<- END
	This line has 1 leading tab.
	  This line has a leading tab and some spaces.
		This line 2 leading tabs.
	END
```

The output is printed with all the leading tabs removed:

```plaintext
This line has 1 leading tab.
    This line has a leading tab and some spaces.
This line 2 leading tabs.
```

~~~~exercism/caution
The author doesn't recommend this usage.
While it can improve the readability of the script,

1. it's easy to accidentally replace the tab characters with spaces (your editor may do this automatically), and 
1. it's hard to spot the difference between spaces and tabs.
~~~~

## When to Use Here Documents

* Multi-line input: when you need to provide multiple lines of text to a command.
* Configuration files: embedding small configuration snippets within a script.
* Generating code: creating code on the fly within a script.
* Scripting interactions: simulating user input for interactive programs.
* Avoiding external files: when you want to avoid creating temporary files.

A typical usage might be to provide some help text:

```bash
#!/usr/bin/env bash

usage() {
    cat << END_USAGE
Refresh database tables.

usage: ${0##*/} [-h|--help] [-A|--no-archive]

where: --no-archive flag will _skip_ the archive jobs
END_USAGE
}

# ... parsing command line options here ...

if [[ $flag_help == "true" ]]; then
  usage
  exit 0
fi
```

## Possible Drawbacks

* Large embedded documents can make your code harder to read.
  It can be better to deploy your script with documentation in separate files.
* Here documents can break the flow of the code.
  You might be in a deeply nested section of code when you want to pass some text to a program.
  The heredoc's indentation can look jarring compared to the surrounding code.

## Here Strings

Like here documents, _here strings_ (or "herestrings") provide input to a command.
However, while heredocs are given as a block of text, herestrings are given as a single string of text.
Here strings use the `<<< "text"` syntax.

```bash
tr 'a-z' 'A-Z' <<< "upper case this string"
```

Output:

```plaintext
UPPER CASE THIS STRING
```

Unlike heredocs, no ending delimiter is required.

### Why Use Here Strings?

A pipeline can be used instead of a here string:

```bash
echo "upper case this string" | tr 'a-z' 'A-Z'
```

So why use a here string?

Consider the case where you get the string as output from a long-running computation, and you want to feed the result to two separate commands.
Using pipelines, you have to execute the computation twice:

```bash
some_long_running_calculation | first_command
some_long_running_calculation | second_command
```

A more efficient approach is to capture the output of the computation (using command substutition), and use here strings to provide input to the two subsequent commands:

```bash
result=$( some_long_running_calculation )
first_command <<< "$result"
second_command <<< "$result"
```

Here's a real-world application of that example:

* capture the JSON response to a REST API query (that is paginated),
* provide the JSON data to a jq program to parse the results and output that to a file, and then
* provide the JSON data to another jq program to determine the URL of the next query.

```bash
# initialize the output CSV file
echo "ID,VALUE" > data.csv

url='https//example.com/api/query?page=1'

while true; do
  json=$( curl "$url" )

  # convert the results part of the response into CSV
  jq -r '.results[] | [.id, .value] | @csv' <<< "$json"

  # get the URL for the next page
  url=$( jq -r '.next_url // ""' <<< "$json" )
  if [[ "$url" == "" ]]; then
    break
  fi
done >> data.csv
```

Note the position of the output redirection.
All output from the while loop will be appended to the file `data.csv`.

## Heredocs and Herestrings as Redirection

Because these are just forms of redirection, they can be combined with other redirection operations:

```bash
cat <<< END_OF_TEXT > output.txt
This is my important text.
END_OF_TEXT

awk '...' <<< "$my_var" >> result.csv
```

## In Summary

Here documents (or "heredocs") are a flexible and convenient way to manage multi-line input in Bash scripts.
They simplify the process of embedding text and data directly within your scripts, making them more self-contained and easier to read.

Here strings (or "herestrings") are like here documents, but offer a simpler, more dynamic syntax.
