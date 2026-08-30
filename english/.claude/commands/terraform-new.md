---
description: Add a new Terraform resource/module
disable-model-invocation: true
argument-hint: [the resource/module to add]
---

Add a new Terraform resource according to `$ARGUMENTS`.

1. Check the target environment (`terraform/envs/dev/` / `terraform/envs/prod/` etc.) and whether an existing module under `terraform/modules/` can be reused.
2. Design so secrets are never hardcoded in `.tf` files — pass them via `variable` or reference Secrets Manager/SSM (per `terraform.md`).
3. Add the resource and run `terraform fmt` to keep formatting consistent.
4. Run `terraform validate` to check for syntax errors.
5. Run `/terraform-plan` and have the user confirm the diff matches intent.
6. Do not run `apply` — the user reviews it and runs it manually.
