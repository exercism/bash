# About Here Documents

In Bash scripting, a "here document" (or "heredoc") is a way to redirect multiple lines of input to a command or program, as if you were typing them directly into the terminal. 
It's a powerful tool for embedding multi-line text within your scripts without needing external files or complex string manipulation.

## Key Features and Syntax

1. Delimiter: A heredoc starts with the `<<` operator followed by a delimiter word (often called the "marker" or "terminator"). 
  This delimiter can be any word you choose, but it's common to use something like `EOF`, `EOF`, `END`, or `TEXT` for clarity.

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
./your_script.sh << MY_DATA
Item 1
Item 2
Item 3
MY_DATA
```

This example shows how you can pass data to a script.

## Variations and Advanced Features

* Stripping Leading Tabs: If you use `<<-` instead of `<<`, Bash will strip leading _tab characters_ from each line of the heredoc. 
This is useful for indenting the heredoc content within your script without affecting the output.

```bash
# Note, the leading whitespace is tabs only!
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

* Literal Content: Quoting the delimiter (single or double quotes) prevents parameter expansion, command substitution, and arithmetic expansion within the heredoc. 
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
my_var="Hello"
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

## In Summary

Here documents are a flexible and convenient way to manage multi-line input in Bash scripts. 
They simplify the process of embedding text and data directly within your scripts, making them more self-contained and easier to read. 
They are a very useful tool for any bash scripter.
