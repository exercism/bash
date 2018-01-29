# Track Policies

This document:

- describes all current track-wide policies; and
- lists all policies that should be reviewed in response to any given track event.

Maintainers should refer to this document each time they review a pull request.

Our policies are not set-in-stone. They represent directions chosen at a point in time with the information/context available at that time. We actively encourage contributors to review and critique them. If you have read through the references that informed an existing policy and still feel it should be improved or removed, please comment and describe:

1. your alternative perspective;
2. your proposed changes; and
3. how your proposal balances your own perspective with those already raised during prior discussions.

## Policy Descriptions

### Standard Bash over POSIX compliance

  - Don't enforce POSIX compliance for our internal code, or code submitted as the solution and we allow users to use any utilities as long as the test passes on their system.
  - Have POSIX compliance as a stretch goal
  - For the stretch goal that could be a good start for a discussion when users submit their solutions.

References: [[1](https://github.com/exercism/bash/issues/88)]

### Don't include a exercise file

When you submit an exercise you should only include only the test file and a README.md file.

References: [[1](https://github.com/exercism/bash/issues/87#event-1446351332)]

### Exercise Test Structure

We will not use functions for tests unless the problems are complex or require them (ex: https://github.com/exercism/bash/blob/master/exercises/triangle/triangle_test.sh)

References: [[1](https://github.com/exercism/bash/issues/150#event-1446340584)]
