# Hints

## General

- A Bash script executes its commands in order.
- The [`echo` command][echo] can print literal output and blank lines.
- Use one `echo` command for each line of output that you print literally.

## 1. Print the shopping list name

- The first word of a command names the command to execute.
- The words after the command name are its arguments, including options and filenames.
- The starter code stores the script's first argument in the `shopping_list_file` variable.
- Any of these commands prints the first line of that file:

  ```bash
  head -n 1 "$shopping_list_file"
  awk 'NR == 1' "$shopping_list_file"
  sed -n '1p' "$shopping_list_file"
  ```

- The quotes keep the filename as one argument even if it contains spaces.
- Choose one command and use it as the first command in your script.

## 2. List the required ingredients

- Invoke `echo` without arguments to print the blank line before the section.
- This command finds and prints the paragraph that starts with `Required ingredients`:

  ```bash
  awk -v RS= '/^Required ingredients/' "$shopping_list_file"
  ```

- The `-v RS=` arguments tell `awk` to treat text separated by blank lines as records, or paragraphs.
- The quoted expression selects the record that starts with the required heading.
- Append the `echo` command and the `awk` command after your task 1 command.

## 3. Print the buttermilk substitution

- Invoke `echo` without arguments to print the blank line before the sentence.
- Quote the whole sentence to preserve its four consecutive spaces in a single argument:

  ```bash
  echo "The substitution for buttermilk is    regular milk"
  ```

- Without quotes, Bash would split the sentence into separate arguments, and `echo` would print only one space between them.

[echo]: https://www.gnu.org/software/bash/manual/bash.html#Bash-Builtins
