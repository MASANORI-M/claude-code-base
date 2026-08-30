---
name: terraform-plan
description: Run Terraform plan and present the diff to the user (never applies)
disable-model-invocation: true
allowed-tools: Bash(terraform *)
---

Never run `apply` under any circumstances. Stop at presenting the plan output.

1. Confirm with the user which environment directory to target (e.g. `terraform/envs/dev/` or `terraform/envs/prod/`).
2. Run `terraform init -input=false` in the target directory (only needed on first run or when modules change).
3. Run `terraform fmt -check` and `terraform validate` to check for formatting issues or syntax errors.
4. Run `terraform plan` and summarize the resources to be added/changed/destroyed for the user.
5. If any change involves a delete (`-`) or replace, call it out prominently to the user.
6. Make it clear that applying is the user's responsibility to run manually — Claude Code will not run it.
