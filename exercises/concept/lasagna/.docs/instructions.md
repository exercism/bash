# Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cookbook.

You have four tasks, all related to the time spent cooking the lasagna.
Each task adds to the same script, so preserve the output from the previous tasks.
Do not print anything other than the requested output.

The script accepts two optional command-line arguments:

1. the number of minutes the lasagna has _actually_ been in the oven.
   If it is missing, use `0`.
2. the number of layers in the lasagna.
   If it is missing, use `1`.

Run the script with:

```bash
bash lasagna.sh 18 3
```

Bash does not yet have arithmetic in this syllabus, so you can use the external `expr` command to do the math, and command substitution to capture its result.
For example, `expr 7 - 2` outputs `5`.

## 1. Define the expected oven time in minutes

According to the cookbook, the expected oven time is 40 minutes.
Store this value in a variable, and print it:

```text
Expected minutes in oven: 40
```

## 2. Calculate the remaining oven time in minutes

Store the actual minutes in the oven (the first argument) in a variable.
Then calculate how many minutes the lasagna still has to remain in the oven, based on the expected oven time from the previous task.
Print it on the next line:

```bash
bash lasagna.sh 18 3
```

```text
Expected minutes in oven: 40
Remaining minutes in oven: 22
```

## 3. Calculate the preparation time in minutes

The preparation time is how long it takes to get the lasagna ready before it is put in the oven.
It takes 2 minutes to prepare each layer.
Store the number of layers (the second argument) in a variable, and store the minutes per layer in another variable instead of using a "magic number".
Print the preparation time on the next line:

```text
Expected minutes in oven: 40
Remaining minutes in oven: 22
Preparation time in minutes: 6
```

## 4. Calculate the total working time in minutes

Calculate how many minutes in total you've worked on cooking the lasagna.
This is the sum of the preparation time and the time the lasagna has spent in the oven so far.
Print it on the last line:

```text
Expected minutes in oven: 40
Remaining minutes in oven: 22
Preparation time in minutes: 6
Total time in minutes: 24
```
