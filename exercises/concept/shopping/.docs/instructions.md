# Instructions

You have a sudden craving for pancakes.
As a modern technically inclined person, you decide to write a Bash script that prints your shopping list.

The complete shopping list is stored in a file.
Pass the filename to the script as its first command-line argument.
The starter code stores this argument in the `shopping_list_file` variable for you; variables will be covered later.
Each task adds to the same script, so preserve the output from the previous tasks.
Do not print anything other than the requested output.

Run the script with:

```bash
bash shopping.sh shopping-list.txt
```

## 1. Print the shopping list name

Use `head`, `awk`, or `sed` (or any other tool you are familar with) to print only the first line of `"$shopping_list_file"`.
Read the name from the file instead of printing a hard-coded name with `echo`.
You do not need to learn these tools in depth for this exercise; the hints provide suitable commands.

With the supplied file, the output should be:

```text
Ingredients for pancakes
```

## 2. List the required ingredients

Your shopping app is a little too helpful and sometimes inserts coupons or notes into the shopping list.
The required-ingredients section is therefore not guaranteed to occupy the same line numbers.

Use `awk` (or any other tool you are familiar with) to find and print the section that begins with the `Required ingredients` heading in `"$shopping_list_file"`.
Do not rely on fixed line numbers.
Print a blank line after the shopping list name and before this section.

With the supplied file, this task adds the following output after that blank line:

```text
Required ingredients
1 cup flour
0.25 cup sugar
1 teaspoon baking powder
0.25 teaspoon baking soda
1 pinch salt
1 cup buttermilk
1 egg
1 tablespoon melted butter
```

## 3. Print the buttermilk substitution

You arrive at the store and discover that it is out of buttermilk.
Fortunately, the substitutions section says that you can use regular milk.

After the required-ingredients section, print a blank line.
Then use `echo` to print the following sentence:

```text
The substitution for buttermilk is    regular milk
```

The four spaces between `is` and `regular milk` are intentional.
Your output must match it exactly.
