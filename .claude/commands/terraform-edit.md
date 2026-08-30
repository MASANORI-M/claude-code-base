---
description: 既存のTerraformリソース定義を変更する
disable-model-invocation: true
argument-hint: [対象リソース] [変更内容]
---

$ARGUMENTS で指定された既存のTerraformリソースを変更する。

1. 対象の `.tf` ファイルを特定し、現在の定義を確認する。
2. 変更が既存リソースの削除・置換（recreate）を伴わないか事前に検討する。伴う場合は影響（ダウンタイム、データ消失リスク等）をユーザーに明示する。
3. 変更後、`terraform fmt` / `terraform validate` を実行する。
4. `/terraform-plan` でplanを実行し、差分（特に `-`/`replace`）を確認してユーザーに報告する。
5. `apply` は実行しない。
