
# Track Policies

This document:

- describes all current track-wide policies; and
- lists all policies that should be reviewed in response to any given track event.

Maintainers should refer to this document each time they review a pull request.

Our policies are not set-in-stone.
They represent directions chosen at a point in time with the information/context available at that time.
We actively encourage contributors to review and critique them.
If you have read through the references that informed an existing policy and still feel it should be improved or removed, please comment and describe:

1. your alternative perspective;
2. your proposed changes; and
3. how your proposal balances your own perspective with those already raised during prior discussions.

## Policy Descriptions

### Style Guide

When contributing code to this repository, it should follow the [bash style guide] to avoid having an inconsistent style.
This is most important for the tests, since they are delivered as a product, and should be as idiomatic as possible, and this will help maintain a certain level of consistency.

[bash style guide]: https://google.github.io/styleguide/shell.xml

### Prefer standard Bash over POSIX compliance

When submitting or updating exercises, POSIX compliance is not required.
This applies when discussing sumbissions for the exercises.
You can make POSIX compliance a stretch goal, and that could be a good start for a discussion with users.

References: [[1](https://github.com/exercism/bash/issues/88)]

### Exercise structure

Please see the [Practice Exercises](https://exercism.org/docs/building/tracks/practice-exercises)
document, which thoroughly discusses the structure of an exercise.

### Exercise Test Structure

The tests will not enforce using a specific function, unless the problems are complex or requires it (ex: https://github.com/exercism/bash/blob/main/exercises/practice/list-ops/list_ops_test.sh)

```
run bash exercise.sh "string"
```

instead of
```
run bash exercise.sh exercise "string"
```

References: [[1](https://github.com/exercism/bash/issues/150#event-1446340584)]
