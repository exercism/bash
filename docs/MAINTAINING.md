# Welcome!

This is a guide/reference for maintainers of the Bash track.

- [Your Permissions](#your-permissions)
- [Maintainer Guides](#maintainer-guides)
- [Syncing with problem-specifications](#syncing-with-problem-specifications)
- [Miscellaneous](#miscellaneous)

## Your Permissions 

As a maintainer, you have write access to several repositories.  "write access" means you can: review, reject, accept and merge PRs; and push changes to these repos.  Despite having permissions to push directly, we tend to seek review of even our own PRs.

### Track-specific

- [bash](https://github.com/exercism/bash) — Probably where you are now!

### Exercism-wide

- [problem-specifications](https://github.com/exercism/problem-specifications) — the library of canonical exercises.
- [docs](https://github.com/exercism/docs) - the place to find project-wide documentation.
- [Exercism forum](https://forum.exercism.org) — where project-wide conversations happen.

## Maintainer Guides

- **[Maintainers](https://exercism.org/docs/community/maintainers)**

## Syncing with problem-specifications

The track is synced with `problem-specifications` using `bin/configlet sync`.
Without `--update`, `sync` only reports what is out of date; with `--update`, it prompts before writing.

The [Run Configlet Sync workflow](../.github/workflows/run-configlet-sync.yml) runs on the 15th of each month (and can be started manually).
It opens a PR for the docs and metadata changes, and an issue for the tests that need syncing.
Review and merge that PR; sync tests by hand, working from the issue.

To do the whole sync by hand, work on a new branch off `main` and open one PR with several commits, in this order:

1. Docs: update exercise instructions and introductions.

   ```bash
   bin/configlet sync --update --docs
   ```

   Commit the result.

2. Metadata: update `.meta/config.json` metadata values.

   ```bash
   bin/configlet sync --update --metadata
   ```

   Commit the result.

3. Tests: one commit _per exercise_ that has tests to sync.
   First list the exercises with unsynced tests:

   ```bash
   bin/configlet sync --tests
   ```

   Then, for each exercise `$e` listed:

   ```bash
   bin/configlet sync --update --tests --exercise "$e"
   ```

   `sync` prompts for each missing test (include or exclude).
   Then finish that exercise before committing:

   - Syncing only updates `.meta/tests.toml`; the test file must then be brought in line with it.
     If the exercise has `.meta/template.j2`, regenerate the tests with `bin/generate_tests "$e"`, adjusting the template first if the new tests need it.
     If there is no template, update the `.bats` file by hand to reflect the current tests.
   - Update `.meta/example.sh` if the new tests require it.
   - Run `bin/validate_one_exercise exercises/practice/$e`.
   - Commit all of the exercise's changes together.

Before opening the PR, run `bin/configlet sync` again and confirm it reports nothing left to do.
Then run `bin/validate_exercises`, `bin/lint`, and `bin/configlet lint`.

## Miscellaneous

- Proposed changes must first be discussed in [the Exercism forum](https://forum.exercism.org/c/programming/bash/70)

**Please feel free to ask any questions.  In our thinking, asking questions is far smarter than guessing.**
