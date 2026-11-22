---
name: add-concept-exercise
description: Scaffold a complete concept exercise for the Exercism Bash track, given a concept slug. Creates the exercise directory under exercises/concept/, all student-facing and meta files, and the track-level config.json entry, then validates everything.
---

# Add a Concept Exercise (Bash track)

This track has concept _documentation_ (`concepts/<slug>/`) but the learning syllabus is incomplete: there are few or no concept _exercises_ (`exercises/concept/<slug>/`).
This skill walks through adding one correctly.

## Inputs

Collect these before starting (ask the user for anything missing):

- **concept slug** (required): one of the slugs in `concepts/` and in the top-level `config.json` `concepts` array, e.g. `variables`, `arrays`, `conditionals`, `looping`, `arithmetic`, `quoting`, `pipelines`, `functions`, `redirection`, `heredocs`, `commands-and-arguments`, `more-arrays`.
- **exercise slug** (required): kebab-case, matching `[a-z0-9-]+`, named after the **story/theme**, NOT after the concept (`lasagna`, `bird-count`, `log-line-parser` are good; `floating-point-numbers` is not).
- **exercise name** (required): display name, e.g. `Lucian's Luscious Lasagna`.
- **story/theme**: a short narrative framing the tasks.
- **author handle**: the user's GitHub/Exercism handle for `.meta/config.json`.

Prefer reusing an existing Exercism story when one fits the concept: it comes with a ready-made exercise icon and cross-track familiarity.
The canonical story list is at <https://exercism.org/docs/building/tracks/stories>.
A novel story works too, but the exercise will need an icon eventually (see "Follow-ups" below).

## Prerequisites: where the exercise fits in the syllabus

`docs/SYLLABUS.md` defines the intended concept ordering.
The exercise's `prerequisites` are the concepts the student must already have unlocked before attempting this one.
Read `docs/SYLLABUS.md` and the target concept's `concepts/<slug>/introduction.md` and `about.md` before writing anything.

## Step 1: Scaffold the exercise directory

Create `exercises/concept/<slug>/` (kebab-case directory) with these files.
Filenames use snake_case derived from the slug (e.g. `bird-count` → `bird_count.sh` / `bird_count.bats`).

### `<snake_slug>.sh` — student stub

- Shebang `#!/usr/bin/env bash`.
- Guiding comments only: describe the input, the expected output, and hints about structure.
  NEVER include a working solution in the stub.
- Match the tone of existing stubs, e.g. `exercises/practice/two-fer/two_fer.sh`.

### `<snake_slug>.bats` — tests

- Start with `#!/usr/bin/env bats` and `load bats-extra`.
- **Concept exercise tests have NO skip directives.**
  The `[[ $BATS_RUN_SKIPPED == "true" ]] || skip` convention applies only to practice exercises.
  `bin/validate_one_exercise` enforces this split automatically (it only checks skips outside `exercises/concept/`).
- Use `test_snake_case_names() { # @test` and keep test order aligned with the numbered tasks in `.docs/instructions.md`.
- Use `run bash <snake_slug>.sh ...` and the `assert_success` / `assert_failure` / `assert_output` family from `bats-extra.bash`.
- Tests are hand-written: concept exercises have no `.meta/template.j2` or `.meta/tests.toml`, and `bin/generate_tests` does not apply.

### `bats-extra.bash` — vendored assertion library

Copy it verbatim from any practice exercise, e.g.:

```bash
cp exercises/practice/two-fer/bats-extra.bash exercises/concept/<slug>/
```

Do not modify it.

### `.docs/introduction.md` — concept intro for this exercise

- Introduces the concept(s) the exercise teaches, as the student will see it alongside the exercise.
- Derive it from `concepts/<slug>/introduction.md`, but condense: cover only what the tasks require.
  It is fine to copy sections verbatim.

### `.docs/instructions.md` — story and tasks

- Open with the story, then numbered tasks (`## 1. ...`, `## 2. ...`).
- Each task states exactly what the program must output for given inputs; include example invocations (`bash <snake_slug>.sh ...`) and expected output where it helps.
- See `../jq` track concept exercises (e.g. `exercises/concept/lasagna/.docs/instructions.md`) for the house style.

### `.docs/hints.md` — hints

- A `## General` section, then one section per task mirroring the instruction headings.
- Link to relevant reference docs (GNU bash manual sections, the track's own concept pages).

### `.meta/config.json` — exercise metadata

```json
{
  "authors": ["<author-handle>"],
  "files": {
    "solution": ["<snake_slug>.sh"],
    "test": ["<snake_slug>.bats"],
    "exemplar": [".meta/exemplar.sh"],
    "invalidator": ["bats-extra.bash"]
  },
  "blurb": "<one-sentence description of what the exercise teaches>"
}
```

Note the key is `exemplar`, not `example` — concept exercises use an _exemplar_ solution, and the track-level `config.json` `files` section already maps `"exemplar": [".meta/exemplar.sh"]`.

### `.meta/exemplar.sh` — reference solution

- The reference solution; must pass every test in `<snake_slug>.bats`.
- Must be ShellCheck-clean (`bin/lint` covers exercise shell files).
- Follow POLICIES.md (Google Shell Style Guide) and the track's bash conventions: quote expansions, use `local` in functions, prefer builtins where appropriate.
- Exemplars should model good style: this is what "done well" looks like.

### `.meta/design.md` — design document

Use this structure (adapted from the jq track's concept exercises):

```markdown
# Design

## Goal

The goal of this exercise is to introduce <concept>.

## Learning objectives

- <specific, testable things the student learns>

## Out of scope

- <related things deliberately not covered>

## Concepts

The Concepts this exercise unlocks are:

- `<concept-slug>`

## Prerequisites

- `<prerequisite-concept-slug>`
```

Every learning objective must be addressable in the exercise itself.
For each objective, be able to point to where the student learns it (`.docs/introduction.md`, stub comments) and, where practical, where the student practices it (a task in `.docs/instructions.md` and its tests).
If an objective is neither taught nor exercised, reword the objective or change the exercise.

## Step 2: Register the exercise in the track config

Edit the top-level `config.json`:

1. If there is no `exercises.concept` key yet, add it; otherwise append to it.
   Concept exercises are listed in syllabus order (prerequisites first):

   ```json
   "concept": [
     {
       "slug": "<slug>",
       "name": "<Exercise Name>",
       "uuid": "<new uuid>",
       "concepts": ["<concept-slug>"],
       "prerequisites": ["<prereq-slug>", "..."],
       "status": "wip"
     }
   ]
   ```

2. Generate the uuid with `uuidgen | tr 'A-F' 'a-f'` (or `bin/configlet uuid` if configlet is available).
   Never reuse or invent non-random uuids.
3. New exercises start as `"status": "wip"`.
   Flip to `"beta"` (and later `"active"`) once reviewed.
4. `status.concept_exercises` at the top level stays `false` until the first concept exercise ships as `beta`/`active`; set it to `true` at that point.
5. Do not touch `exercises.practice` or `exercises.foregone`.
6. Preserve the existing JSON formatting (2-space indent) and LF line endings.

## Step 3: Validate

Run these in order and report the results honestly:

1. **Learning objectives coverage review (manual):**
   For each learning objective in `.meta/design.md`, name the file(s) that address it (introduction, instructions task, hints, stub, or tests).
   Confirm no task requires knowledge listed under "Out of scope".
   Resolve any objective that is neither taught nor exercised before proceeding.

2. **Exercise tests against the exemplar:**

   ```bash
   bin/validate_one_exercise exercises/concept/<slug>
   ```

   This copies the exemplar over the stub name in a temp dir and runs the bats suite.
   It must pass all tests with zero skips.

3. **ShellCheck:**

   ```bash
   bin/lint
   ```

   Note: `bin/lint` derives its file list from `config.json` and skips exercises with `"status": "wip"`, so it will NOT cover a brand-new exercise.
   Also run shellcheck directly on the new files:

   ```bash
   shellcheck exercises/concept/<slug>/<snake_slug>.sh \
              exercises/concept/<slug>/.meta/exemplar.sh
   ```

4. **Configlet** (metadata/config consistency):

   ```bash
   bin/configlet lint
   ```

   If `bin/configlet` does not exist, run `bin/fetch-configlet` first.
   If configlet cannot be fetched or run, say so — never claim it passed.

5. **Review the diff:** `git status` and `git diff` — changes should be limited to the new exercise directory and the `exercises.concept` / `status` entries in `config.json`.

## Gotchas

- Bats `run` merges stdout and stderr into `$output`: exemplar code must not print diagnostics.
  While debugging tests, write to fd 3 (`printf '...\n' >&3`) and remove it before finishing.
- Concept exercises have no skip directives and no `tests.toml`/`template.j2`.
- Keep LF line endings everywhere.
- The stub must remain a stub — do not let exemplar code leak into it.
- If debugging output is added to track tooling (scripts under `bin/`), write it to stderr and remove it before finishing.

## Follow-ups (mention these to the user; do only if asked)

- Update `docs/SYLLABUS.md` to link the new exercise.
- If the story is novel (not forked from another track), the exercise needs an icon: open an issue in the exercism/website-icons repository.
- When the exercise (and enough of the syllabus) is ready for students, change its status from `wip` to `beta` and set top-level `status.concept_exercises` to `true`.
