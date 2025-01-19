# About Functions

Many Bash scripts are written in a strictly imperative style: execute one command, then execute another command, and so on.
Sometimes you need to group together a sequence of commands that conceptually perform a single purpose.
This is where _functions_ come in.

## Defining a Function

You define a function like this:

```bash
my_function () {
    COMMANDS
}
```

The empty set of parentheses simply denotes that you are defining a function.
Nothing goes inside them.

## Function Parameters

Functions, once defined, act like any other command (builtin or not).
Like any command, you can provide _arguments_ to your functions.
Inside the functions, you access the arguments using the _positional parameters_, `$1`, `$2`, etc.
(Recall, we learned about positional parameters in the [Variables][variables] concept.)

~~~~exercism/advanced
The special parameter `$0` is not changed inside a function; it is still the name of the executing script.
The currently executing function can access its name with the `$FUNCNAME` variable.

See [3.4.2 Special Parameters][special] in the manual.

[special]: https://www.gnu.org/software/bash/manual/bash.html#Special-Parameters
~~~~

## Variables

You can define variables inside a function.
If you declare the variables with the `local` command, the _scope_ of the variable is limited to the current function (and to any functions called by it).
Otherwise, the variable is placed in the _global scope_.

Local variables can have the same name as a global variable.
In that case, the local variable "shadows" the global variable.
For instance, a local variable declared in a function hides a global variable of the same name: references and assignments refer to the local variable, leaving the global variable unmodified.
When the function returns, the global variable is once again visible.

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

This outputs

```none
in the global scope, 5 == 5
in my function, 100 == 100
back in the global scope, 5 == 5
```

Inside a function, you can access variables from the _caller_'s scope.
That means you can use global variables, as well as local variables that were declared in the caller (or in some function that calls the caller).

~~~~exercism/advanced
Technically, "global" is not the right word to use.
To expand a variable in a function, Bash will traverse up the call stack, as far as the global scope, to find a function where that variable name has been declared.

This example is adapted from the [Shell Functions][man-funcs] section of the manual:

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

Similarly, _assigning_ a value to a variable will assign it _in the scope where it was declared_.
This "action at a distance" can create hard-to-follow code, as it is not always obvious where a variable was assigned a value.

[man-funcs]: https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions
~~~~

~~~~exercism/advanced
The call stack can be examined using [the `FUNCNAME` array variable][funcname].

[funcname]: https://www.gnu.org/software/bash/manual/bash.html#index-FUNCNAME
~~~~

## Return Values

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

Using `return` with no arguments returns the status of the last command executed.

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

Your function can print to standard output.
Use the familiar _command substitution_ to capture it:

```bash
d6 () { echo "$(( 1 + RANDOM % 6 ))"; }

die=$( d6 )
echo "You rolled a $die."
```

### Using Both the Output and the Status

The exit status of a function is available to use even when you are capturing the output.

```bash
roll () {
    local n=$1
    if (( 4 <= n && n <= 20 )); then
        echo "$(( 1 + RANDOM % n ))"  # exit status is 0
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

An example:

```bash
fibonacci() {
    local n=$1
    if (( n <= 1 )); then
        echo "1"
    else
        local a=$(fibonacci "$(( n - 1 ))")
        local b=$(fibonacci "$(( n - 2 ))")
        echo "$(( a + b ))"
    fi
}

for i in {1..10}; do fibonacci "$i"; done
# => 1
# => 2
# => 3
# => 5
# => 8
# => 13
# => 21
# => 34
# => 55
# => 89
```

~~~~exercism/advanced
The recursion depth can be controlled with [the `FUNCNEST` variable][funcnest].

```bash
bash -c '
    recur() {
        echo $1
        recur $(($1 + 1))
    }
    FUNCNEST=5
    recur 1
'
```

```none
1
2
3
4
5
environment: line 1: recur: maximum function nesting level exceeded (5)
```

[funcnest]: https://www.gnu.org/software/bash/manual/bash.html#index-FUNCNEST
~~~~

[variables]: https://exercism.org/tracks/bash/concepts/variables
