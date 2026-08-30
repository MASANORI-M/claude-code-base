---
description: バックエンド(Laravel)の不具合を調査・修正する
disable-model-invocation: true
argument-hint: [不具合の内容]
---

$ARGUMENTS の不具合について、バックエンド側の調査・修正を行う。

1. 不具合の再現条件を整理する。エラーログは `docker compose logs backend` および `backend/storage/logs/laravel.log` を確認する。
2. 該当のController/Service/Model/マイグレーションを `Read`/`Grep` で調査し、原因を特定する。
3. DBスキーマの問題であれば、既存マイグレーションを直接編集せず新規マイグレーションで対応する。
4. 原因箇所に対して最小限の修正を行う。
5. 修正後、関連するFeatureテストを実行して確認する。テストが無ければ再発防止のために追加する。
