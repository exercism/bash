# About Here Documents

In Bash scripting, a "here document" (or "heredoc") is a way to redirect multiple lines of input to a command or program, as if you were typing them directly into the terminal. 
It's a powerful tool for embedding multi-line text within your scripts without needing external files or complex string manipulation.

## Key Features and Syntax

1. Delimiter: A heredoc starts with the `<<` operator followed by a delimiter word (often called the "marker" or "terminator"). 
  This delimiter can be any word you choose, but it's common to use something like `EOF`, `EOF`, `END`, or `TEXT` for clarity.
  For more readable code, you can add the purpose of the document to the delimiter, for example `END_INSTALLATION_INSTRUCTIONS`.

1. Content: After the initial `<< DELIMITER`, you write the content you want to redirect. This can be multiple lines of text, code, or anything else.

1. Termination: The heredoc ends when the delimiter word appears again on a line by itself, with no leading or trailing spaces.

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

* Bash reads everything between the `<< DELIMITER` and the `DELIMITER` on its own line.
* This content is then treated as standard input (`stdin`) for the command.
* The command processes this input as if it were coming from the keyboard.

## Example 1: Simple Text Output

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

## Example 2: Using with wc (Word Count)

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

## Example 3: Passing to a Script

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

## Variations and Advanced Features

### Stripping Leading Tabs

If you use `<<-` instead of `<<`, Bash will strip leading _tab characters_ from each line of the heredoc. 
This is useful for indenting the heredoc content within your script without affecting the output.

```bash
# Note, the leading whitespace is tab characters only, not spaces!
cat <<- END
	This line has a leading tab.
	This line also has a leading tab.
END
```

The output is printed without the leading tabs:

```plaintext
This line has a leading tab.
This line also has a leading tab.
```

The author doesn't recommend this usage.
While it does improve the readability of the script, it's too easy to accidentally replace the tab characters with spaces and it's too hard to spot the difference.

### Literal Content

Quoting the delimiter (single or double quotes) prevents parameter expansion, command substitution, and arithmetic expansion within the heredoc. 
The content is taken literally.

```bash
cat <<'EOF'
The value of $HOME is not expanded here.
The result of $(date) is not executed.
EOF
```

Output:

```plaintext
The value of $HOME is not expanded here.
The result of $(date) is not executed.
```

If the delimiter is not quoted, variable expansion, command substitution, and arithmetic expansion will occur.

```bash
cat <<EOF
The value of HOME is $HOME
The current date is $(date)
EOF
```

Output:

```plaintext
The value of HOME is /home/glennj
The current date is Thu Apr 24 13:47:32 EDT 2025
```

## When to Use Here Documents

* Multi-line input: When you need to provide multiple lines of text to a command.
* Configuration files: Embedding small configuration snippets within a script.
* Generating code: Creating code on the fly within a script.
* Scripting interactions: Simulating user input for interactive programs.
* Avoiding external files: When you want to avoid creating temporary files.

## Here Strings

Like heredocs, _here strings_ provide input to a command.
However, while heredocs are given as a block of text, here strings are given as a single string of text.
Here strings use the `<<< "text"` syntax.

```bash
tr 'a-z' 'A-Z' <<< "upper case this string"
```

Output: `UPPER CASE THIS STRING`

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
  looping=true

  while $looping; do
    json=$( curl "$url" )
    # handle non-success response here ...

    jq -r '.results[] | [.id, .value] | @csv' <<< "$json"

    url=$( jq -r '.next_url // ""' <<< "$json" )
    if [[ "$url" == "" ]]; then
      looping=false
    fi
  done >> data.csv
  ```

  Note the position of the output redirection.
  All output from the while loop will be appended to the file `data.csv`.

## Heredocs and Herestrings are Redirections

Because they are just redirections, they can be combined with other redirections:

```bash
cat <<< END_OF_TEXT > output.txt
This is my important text.
END_OF_TEXT

awk '...' <<< "$my_var" >> result.csv
```

## In Summary

Here documents are a flexible and convenient way to manage multi-line input in Bash scripts. 
They simplify the process of embedding text and data directly within your scripts, making them more self-contained and easier to read. 

Here strings are like here documents, but offer a simpler, more dynamic syntax.
