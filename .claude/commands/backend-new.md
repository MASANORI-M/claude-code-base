---
description: 新規APIエンドポイント（Model/Migration/Controller/Request）を作成する
disable-model-invocation: true
argument-hint: [リソース名] [簡単な説明]
---

$ARGUMENTS の内容に従って、新規Laravel APIエンドポイントを一式作成する。

1. `$ARGUMENTS` からリソース名（例: Task）と用途を把握する。
2. 必要に応じて以下を作成する（コンテナ内で `docker compose exec backend php artisan ...` を使う）:
   - `php artisan make:migration create_{テーブル名}_table` でマイグレーション追加
   - `php artisan make:model {Model名}`
   - `php artisan make:request {Model名}Request`（バリデーション用）
   - `php artisan make:resource {Model名}Resource`（レスポンス整形用）
   - `php artisan make:controller Api/{Model名}Controller --api`
3. `backend.md` の規約（Controllerは薄く、ロジックはServiceへ、Eloquentモデルを直接返さない）に沿って実装する。
4. `routes/api.php` にルートを追加する。
5. `docker compose exec backend php artisan migrate` でマイグレーションを適用する。
6. Feature テストを1つ以上作成する（`/backend-test` を使ってもよい）。
