---
name: docker-up
description: Docker Composeで開発環境（frontend/backend/db）を起動する
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

1. `.env` が存在するか確認する。無ければ `.env.example` からコピーするようユーザーに提案する。
2. `docker compose up -d --build` を実行する。
3. `docker compose ps` で各サービス（frontend, backend, db）が起動していることを確認する。
4. `backend` コンテナで `APP_KEY` が未設定なら `docker compose exec backend php artisan key:generate` を実行する。
5. `db` が起動してから `docker compose exec backend php artisan migrate` を実行し、マイグレーションが正常に流れるか確認する（初回起動時、または新しいマイグレーションがある場合）。
6. `docker compose logs backend --tail=50` でエラーがないかチェックする。
7. 問題なければ以下をユーザーに伝える:
   - フロントエンド: http://localhost:3000
   - バックエンドAPI: http://localhost:8000
8. エラーがあればログを解析し、原因（ポート競合、DB未接続、composer/npmのビルド失敗など）を切り分けて報告する。
