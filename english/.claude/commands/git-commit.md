---
description: Review the changes and create a commit following the convention
disable-model-invocation: true
argument-hint: [optional: extra context for the commit]
---

Using `$ARGUMENTS` as context if provided, create a commit as follows.

1. Check the changes with `git status` and `git diff` (both staged and unstaged).
2. Check that no `.env` or other secret-bearing files are included; exclude them if they are.
3. Stage only the relevant files with `git add` (never `git add -A` / `git add .`).
4. Write the commit message in Conventional Commits format (`feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`, etc.) based on the change (per `git.md`).
5. Run `git commit` and confirm success with `git status`.
6. Do not push (do so only if the user separately instructs it).
