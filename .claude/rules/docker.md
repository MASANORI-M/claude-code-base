---
paths:
  - "docker-compose*.yml"
  - "**/Dockerfile*"
---

# Docker 運用ルール（ローカル専用）

- `docker-compose.yml` / `Dockerfile` はローカル開発環境専用。本番AWSインフラ（ECS/Fargate, RDS, ALB, VPC等）はTerraform（`terraform/`配下、`.claude/rules/terraform.md`参照）で管理し、本ファイルの対象外とする。ECS定義への変換等、AWSデプロイ用の設定をこのファイル群に混在させない。
- サービス構成は `frontend`（React）、`backend`（PHP-FPM上のLaravel）、`db`（MySQL）を基本とする。Laravelは `php artisan serve` で簡略化するか、nginx等のwebserverコンテナを別途置くかをプロジェクト方針として `/setup-project` 実行時にユーザーに確認する。
- ポートは `frontend:3000`, `backend:8000`, `db:3306` を既定とする。変更する場合は README も更新する。
- MySQLのデータは名前付きボリュームで永続化する。破棄は `docker compose down -v` のときのみで、実行前に必ずユーザーに確認する。
- Laravelの `backend` コンテナはソースディレクトリをボリュームマウントし、コード変更が即反映されるようにする（開発体験優先）。
- 秘密情報は `.env`（LaravelのAPP_KEYやDB接続情報を含む）にまとめ、Gitには `.env.example`（値は空/ダミー）のみコミットする。`.env` 自体は `.gitignore` に入れる。
- `docker-compose.yml` を変更したら、`/docker-up` で起動確認してから作業を終える。
