---
paths:
  - "backend/app/**/*.php"
  - "backend/routes/**/*.php"
---

# Laravel バックエンド規約

- Controller は薄く保つ。複雑なビジネスロジックは `app/Services/` や `app/Actions/` のクラスに分離する。
- バリデーションは Controller に直接書かず、Form Request クラス（`php artisan make:request`）を使う。
- レスポンスは Eloquent モデルを直接返さず、API Resource（`php artisan make:resource`）で整形する。
- ルーティングは `routes/api.php` に定義し、Web用の `routes/web.php` とは分離する。
- 秘密情報（DB接続情報、APP_KEY等）は `.env` で管理し、`config/*.php` にハードコードしない。
- DBアクセスは Eloquent ORM を基本とし、生SQLが必要な場合のみ理由をコメントで残す。
- 新しいエンドポイントを追加したら Feature テスト（`php artisan make:test --pest` または `--phpunit`）を1つ以上添える。
- スキーマ変更は必ず `php artisan make:migration` で作成する（database.md 参照）。
