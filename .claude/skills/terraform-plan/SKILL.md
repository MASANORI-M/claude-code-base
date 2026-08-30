---
name: terraform-plan
description: Terraformのplanを実行し、変更差分をユーザーに提示する（applyはしない）
disable-model-invocation: true
allowed-tools: Bash(terraform *)
---

`apply` は絶対に実行しない。plan結果の提示までを行う。

1. 対象環境のディレクトリ（`terraform/envs/dev/` または `terraform/envs/prod/` など）をユーザーに確認する。
2. 対象ディレクトリで `terraform init -input=false`（初回・モジュール変更時のみ）を実行する。
3. `terraform fmt -check` と `terraform validate` を実行し、フォーマット崩れや構文エラーがないか確認する。
4. `terraform plan` を実行し、追加・変更・削除されるリソースを整理してユーザーに報告する。
5. 削除(`-`)や置換(`replace`)を伴う変更がある場合は、特に目立たせてユーザーに注意喚起する。
6. `apply` はユーザー自身が手動で実行する運用のため、Claude Codeからは実行しない旨を明示する。
