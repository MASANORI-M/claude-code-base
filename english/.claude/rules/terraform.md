---
paths:
  - "terraform/**/*.tf"
  - "terraform/**/*.tfvars"
---

# Terraform(AWS) Conventions

- The scope is the full application runtime stack (ECS/Fargate, RDS, ALB, VPC, etc.). Split directories per environment, e.g. `terraform/envs/dev/`, `terraform/envs/prod/` (don't use workspaces).
- Extract anything shared across environments into `terraform/modules/`, and reference it from each environment.
- Manage state in a remote backend (e.g. S3 with DynamoDB locking) — don't commit local state or the `.terraform/` directory.
- Don't write secrets (DB passwords, etc.) in plaintext in `.tfvars` — design references through AWS Secrets Manager / SSM Parameter Store instead. Keep `.tfvars` itself out of Git as well.
- Keep `*.tfstate`, `*.tfvars`, and `.terraform/` out of Git (see the `.gitignore` at the repository root).
- **Claude Code must never run `terraform apply` / `terraform destroy`.** Always present the `terraform plan` output to the user; the user applies it manually (use `/terraform-plan`).
- For changes that delete or replace (recreate) resources, spell out the impact (downtime, risk of data loss) before proceeding.
- Include the project name and environment name in naming/tagging (e.g. `Environment = "prod"`).
