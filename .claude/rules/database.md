---
paths:
  - "backend/database/**"
---

# MySQL / マイグレーション規約

- スキーマ変更は必ず `php artisan make:migration` で作成する。既存のマイグレーションファイルは修正しない（新しいマイグレーションを追加する）。
- テストデータ・初期データは Seeder（`database/seeders/`）と Factory（`database/factories/`）で用意し、マイグレーションファイルに直接INSERT文を書かない。
- ローカルDBを作り直したいときは `/db-reset` コマンドを使う（データが消えるため、実行前に確認する）。
- テーブル名・カラム名はLaravelの規約に従う（テーブル名はスネークケース複数形、外部キーは `{単数形}_id`）。
