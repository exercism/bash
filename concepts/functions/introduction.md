# Functions

Many Bash scripts are written in a strictly imperative style: execute one command, then execute another command, and so on.
But often you'll need to have a group of commands that conceptually perform a single purpose.
This is where _functions_ come in.

## Defining a Function

You declare a function is one of two ways.
The first is a "portable" style

```bash
funcname () { COMMANDS; }
```

This is the style that was created with the original Bourne shell.

Alternately, you can use the `function` keyword

```bash
function funcname { COMMANDS; }
```

There is no difference between the two styles.

## Function Parameters

Functions, once defined, act like any other command (builtin or not).
Like any command, you can provide _arguments_ for your functions.
Inside the functions, you access the arguments using the _positional parameters_, `$1`, `$2`, etc.
(Recall, we learned about positional parameters in the [Variables][variables] concept.)

~~~~exercism/advanced
The special parameter `$0` is not changed inside a function; it is still the name of the executing script.
The currently executing function can access its name with the `$FUNCNAME` variable.
~~~~

## Variables

You can define variables inside a function.
If you declare the variables with the `local` command then the _scope_ of the variable is limited to the current function (and to any functions called from it).
Otherwise, the variable is placed in the _global scope_.

Local variables can have the same name as a global variable.
In that case, the local variable _temporarily_ overrides the global one, and the global value is restored when the function returns.

```bash
x=5

myfunc () {
    local x=100
    echo "in my function, $x == 100"
}

echo "in the global scope, $x == 5"

myfunc

echo "back in the global scope, $x == 5"
```

Inside a function, you can access variables from the _caller_'s scope.
That means you can use global variables, or local variables that are declared in some function that calls this one.

~~~~exercism/advanced
Technically, "global" is not the right word to use.
Assignments to non-local variables will assign to the variable with that name that has been declared in some previous scope, up to the global scope.

This example is taken from the bash manual

```bash
func1() {
    local var='func1 local'
    func2
}

func2() {
    echo "In func2, var = $var"
}

var=global
func1
func2
```

The output is:

```none
In func2, var = func1 local
In func2, var = global
```
~~~~

## Return Value

A function, like any command, has an _exit status_.
By default, the status of a function is the exit status of the _last command executed_.

You can use the `return` command to return from a function with a specific exit status.

```bash
check_password () {
    if [[ $1 == "secret" ]]; then
        return 0
    else
        return 1
    fi
}

read -sp "Enter your password: " pass

if check_password "$pass"; then
    echo "Correct!"
else
    echo "Wrong password."
fi
```

~~~~exercism/note
Note that the `check_password` function can be simplified to:

```bash
check_password () { [[ $1 == "secret" ]]; }
```

1. The `[[...]]` conditional construct has an exit status: `0` for "true", `1` for "false.
2. The `{...}` grouping construct must have either a newline or a semicolon before the ending brace.
~~~~

## Function Output

The return status of a function is just a number.
How can a function produce output?

Your function simply emits output on standard output.
Use the familiar _command substitution_ to capture it:

```bash
d6 () { echo $(( 1 + RANDOM % 6 )); }

die=$( d6 )
echo "You rolled a $die."
```

### Using Both the Output and the Status

The exit status of a function is still available to use when you are capturing the output.

```bash
roll () {
    local n=$1
    if (( 4 <= n && n <= 20 )); then
        echo $(( 1 + RANDOM % n ))  # exit status is 0
    else
        return 1
    fi
}

read -p "How many faces does your die have? " faces
if die=$( roll "$faces" ); then
    echo "You rolled a $die."
else
    echo "I can't roll a die with $faces faces."
fi
```

## Recursion

Functions can call themselves recursively.
By default, there is no limit to the depth of recursion.


[variables]: https://exercism.org/tracks/bash/concepts/variables
