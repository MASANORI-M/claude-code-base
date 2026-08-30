---
description: Investigate and fix a Terraform error/issue
disable-model-invocation: true
argument-hint: [description of the issue/error]
---

Investigate and fix the Terraform issue described in `$ARGUMENTS`.

1. Check the error message (from `terraform plan`/`validate` output, etc.) and identify the `.tf` file at fault.
2. If state inconsistency is suspected, check with `terraform state list` etc. Always confirm with the user before running commands that directly manipulate state, such as `terraform state rm`.
3. Make a minimal fix at the root cause.
4. Run `terraform fmt` / `terraform validate`.
5. Run `/terraform-plan` and have the user confirm the diff after the fix.
6. Do not run `apply`.
