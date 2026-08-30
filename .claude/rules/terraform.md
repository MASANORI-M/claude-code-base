---
paths:
  - "terraform/**/*.tf"
  - "terraform/**/*.tfvars"
---

# Terraform(AWS) 規約

- 対象はアプリ実行基盤一式（ECS/Fargate, RDS, ALB, VPC等）。環境ごとに `terraform/envs/dev/`, `terraform/envs/prod/` のようにディレクトリを分割する（workspaceは使わない）。
- 環境間で共通化できる定義は `terraform/modules/` に切り出し、各環境から参照する。
- stateはリモートバックエンド（S3 + DynamoDBによるロック等）で管理し、ローカルstateやディレクトリ内の `.terraform/` をコミットしない。
- 秘密情報（DBパスワード等）は `.tfvars` に平文で書かず、AWS Secrets Manager / SSM Parameter Store経由で参照する設計にする。`.tfvars` 自体もGit管理対象外にする。
- `*.tfstate`, `*.tfvars`, `.terraform/` はGit管理対象外にする（リポジトリ直下の `.gitignore` 参照）。
- **`terraform apply` / `terraform destroy` はClaude Codeからは実行しない。** 必ず `terraform plan` の内容をユーザーに提示し、適用はユーザー自身が手動で行う（`/terraform-plan` を使う）。
- リソースの削除・置換（recreate）を伴う変更は、実行前に影響（ダウンタイム、データ消失リスク）を明示する。
- 命名・タグ付けにはプロジェクト名・環境名を含める（例: `Environment = "prod"`）。
