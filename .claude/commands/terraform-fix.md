---
description: Terraformのエラー・不具合を調査・修正する
disable-model-invocation: true
argument-hint: [不具合・エラーの内容]
---

$ARGUMENTS の内容について、Terraformコードの調査・修正を行う。

1. エラーメッセージ（`terraform plan`/`validate`の出力等）を確認し、原因箇所の `.tf` ファイルを特定する。
2. state不整合が疑われる場合、`terraform state list` 等で確認する。`terraform state rm` 等stateを直接操作するコマンドは、実行前に必ずユーザーに確認する。
3. 原因に対して最小限の修正を行う。
4. `terraform fmt` / `terraform validate` を実行する。
5. `/terraform-plan` でplanを実行し、修正後の差分をユーザーに確認してもらう。
6. `apply` は実行しない。
