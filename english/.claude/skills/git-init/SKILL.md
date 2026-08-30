---
name: git-init
description: Bring this repository under git management (git init, .gitignore check, remote setup, initial commit)
disable-model-invocation: true
allowed-tools: Bash(git *)
---

Only run this if `.git` doesn't already exist in this repository.

1. Run `git status` to check whether `.git` already exists. If it does, do nothing and report the current state to the user.
2. Check the contents of `.gitignore`. If `.env` / `node_modules/` / `vendor/` / `*.tfstate*` / `.terraform/` etc. are missing, suggest the user add them.
3. Run `git init`.
4. Ask the user for the remote repository (GitHub) URL. If one already exists, get the URL; if not, confirm whether to create one now. Once you have it, set it with `git remote add origin <URL>`.
5. Check with `git status` that only the intended files are staged after `git add`, then create the initial commit (message per the `git.md` convention, e.g. `chore: initial commit`).
6. If a remote is configured, confirm with the user before pushing.
