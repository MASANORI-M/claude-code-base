# プロジェクト概要

- 構成: React.js(フロントエンド) / Laravel(バックエンドAPI) / MySQL(DB)
- 開発環境: ローカル開発はDocker上で行う。本番/検証環境はAWS上に構築し、インフラはTerraformで管理する（`terraform/`配下）
- リポジトリ管理: GitHub

## ディレクトリ構成

- `frontend/` — React.js アプリ
- `backend/` — Laravel アプリ
- `docker-compose.yml` — コンテナ構成（frontend / backend / db、必要に応じて webserver）
- `terraform/` — 本番/検証AWSインフラ定義（`envs/dev/`, `envs/prod/`, 共通 `modules/`）

## 開発の始め方

- リポジトリ初期化（初回のみ）: `/git-init`
- 初回セットアップ: `/setup-project`
- 起動: `/docker-up`（内部的には `docker compose up -d --build`）
- 停止: `/docker-down`
- ポート: frontend=3000, backend=8000, db=3306

## カスタムコマンド（フロント/バック開発）

`.claude/commands/` に用意している。新規作成・編集・修正・テスト作成をそれぞれ明示的に呼び出す。
例: `/frontend-new UserProfile`, `/backend-fix ログイン時に500エラーが出る`

## カスタムコマンド（git / Terraform）

- git: `/git-commit`（規約に沿ったコミット作成）, `/git-pr`（PR作成）
- Terraform: `/terraform-new`（新規リソース追加）, `/terraform-edit`（既存リソース変更）, `/terraform-fix`（不具合調査・修正）, `/terraform-plan`（plan実行。applyはしない）

## 基本原則

- ローカル開発（frontend/backend/db）はDocker専用。本番AWSインフラはTerraformで管理する
- **`terraform apply` / `terraform destroy` はClaude Codeからは実行しない。** plan結果の確認までに留め、適用は必ずユーザー自身が手動で行う
- 秘密情報は `.env`（アプリ）や AWS Secrets Manager / SSM Parameter Store（インフラ）で管理し、コードや docker-compose.yml、`.tf`/`.tfvars` に直書きしない
- 詳細な規約は `.claude/rules/` を参照（frontend.md, backend.md, docker.md, database.md, git.md, terraform.md）
- 破壊的操作（DBデータ削除、`docker compose down -v`、`migrate:fresh`、`terraform apply`/`destroy`、`git push --force`、`git reset --hard`）は必ず実行前にユーザーに確認する
