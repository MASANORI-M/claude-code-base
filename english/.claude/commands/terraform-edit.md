---
description: Modify an existing Terraform resource definition
disable-model-invocation: true
argument-hint: [target resource] [what to change]
---

Modify the existing Terraform resource specified in `$ARGUMENTS`.

1. Identify the target `.tf` file and review its current definition.
2. Consider upfront whether the change causes the existing resource to be deleted or replaced (recreate). If so, spell out the impact (downtime, risk of data loss, etc.) to the user.
3. After changing it, run `terraform fmt` / `terraform validate`.
4. Run `/terraform-plan` and report the diff (especially any `-`/`replace`) to the user.
5. Do not run `apply`.
