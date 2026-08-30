---
description: 新しいTerraformリソース/モジュールを追加する
disable-model-invocation: true
argument-hint: [追加したいリソース・モジュールの内容]
---

$ARGUMENTS の内容に従って、Terraformリソースを新規に追加する。

1. 対象環境（`terraform/envs/dev/` / `terraform/envs/prod/` 等）と、`terraform/modules/` に流用できるモジュールがないか確認する。
2. 秘密情報を `.tf` に直書きせず、`variable` 経由・Secrets Manager/SSM参照で設計する（`terraform.md` 準拠）。
3. リソースを追加し、`terraform fmt` でフォーマットを揃える。
4. `terraform validate` で構文エラーがないか確認する。
5. `/terraform-plan` でplanを実行し、意図した差分になっているかユーザーに確認してもらう。
6. `apply` は実行しない。ユーザー自身が確認の上、手動で実行する。
