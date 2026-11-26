# Hints

## General

- A bash script executes its commands in order.
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

## 2. Count the ingredients

- Invoke `echo` without arguments to print the blank line before the count.
- The [`wc` command][wc] counts lines, words, or characters in a file.
- The `-l` option tells `wc` to count lines.
- This command counts the lines in `"$shopping_list_file"`:

  ```bash
  wc -l "$shopping_list_file"
  ```

- `wc` prints the count followed by the filename you gave it as an argument.
- Append the `echo` command and the `wc` command after your task 1 command.

## 3. Print the buttermilk substitution

- Invoke `echo` without arguments to print the blank line before the sentence.
- Quote the whole sentence to preserve its four consecutive spaces in a single argument:

  ```bash
  echo "The substitution for buttermilk is    regular milk"
  ```

- Without quotes, bash would split the sentence into separate arguments, and `echo` would print only one space between them.

[echo]: https://www.gnu.org/software/bash/manual/bash.html#Bash-Builtins
[wc]: https://www.gnu.org/software/coreutils/manual/html_node/wc-invocation.html
