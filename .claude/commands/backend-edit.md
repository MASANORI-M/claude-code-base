---
description: 既存のLaravel APIエンドポイントを編集・仕様変更する
disable-model-invocation: true
argument-hint: [対象エンドポイント/Model名] [変更内容]
---

$ARGUMENTS で指定された既存のAPIエンドポイントに対して、仕様変更・機能追加を行う。

1. `$ARGUMENTS` から対象のController/Model/Requestを特定する。
2. スキーマ変更が必要な場合は、既存マイグレーションを直接編集せず新規マイグレーションを追加する（database.md準拠）。
3. `backend.md` の規約に沿って実装する（Form Requestでのバリデーション、API Resourceでのレスポンス整形など）。
4. 変更がフロントエンドのレスポンス形式に影響する場合は、その旨を明示してユーザーに報告する。
5. 既存のFeatureテストが通ることを確認し、必要なら更新する。
