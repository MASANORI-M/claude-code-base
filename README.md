*Note: The English translation is provided after the Japanese text. The English version of the Claude Code files is located under `/english/`.*

# Claude Code ベース設定

このリポジトリは、[Claude Code](https://claude.com/claude-code) で実装を始めるための**ベースファイル群**です。`CLAUDE.md` と `.claude/`（agents / commands / skills / rules / hooks）に、Claude Codeが安全かつ一貫した方針で作業を進めるための設定一式をまとめています。

現状はReact.js（フロントエンド）/ Laravel（バックエンドAPI）/ MySQL（DB）構成のアプリを、ローカルはDocker、本番はAWS（Terraform管理）で操作できるように具体化してあります（詳細な操作方法はここでは扱いません。各ファイルの中身を参照してください）。

## 中身

| 場所 | 役割 |
|---|---|
| `CLAUDE.md` | プロジェクト概要とClaude Codeへの基本指示 |
| `.claude/agents/` | 役割特化のサブエージェント定義 |
| `.claude/commands/` | `$ARGUMENTS`を伴って呼び出すスラッシュコマンド |
| `.claude/skills/` | 引数を取らない定型オペレーション（起動/停止/初期化など） |
| `.claude/rules/` | 対象パスに応じて自動適用される規約 |
| `.claude/hooks/` | 危険な操作を機械的にブロックする安全対策 |
| `.claude/settings.json` | hooksの有効化設定 |
| `english/` | `CLAUDE.md` / `.claude/` の英訳版 |

現在登録されているagents/commands/skills/rules/hooksは以下の通りです（対象はReact/Laravel/MySQL/Docker/Terraform(AWS)/git）。

- **agents**: `frontend-dev`, `backend-dev`, `docker-infra`, `terraform-dev`, `code-reviewer`
- **commands**: `frontend-new/edit/fix/test`, `backend-new/edit/fix/test`, `git-commit`, `git-pr`, `terraform-new/edit/fix`
- **skills**: `setup-project`, `git-init`, `docker-up`, `docker-down`, `db-reset`, `terraform-plan`
- **rules**: `frontend.md`, `backend.md`, `database.md`, `docker.md`, `git.md`, `terraform.md`
- **hooks**: `protect-files.sh`（秘密情報・stateファイル等の編集ブロック）, `block-dangerous-commands.sh`（`terraform apply/destroy`、`git push --force`、`git reset --hard`のブロック）, `format-file.sh`（保存時の自動フォーマット）

各ファイルの詳細な内容・使い方は、それぞれのファイルおよび `CLAUDE.md` を直接参照してください。

## 基本原則

- **`terraform apply` / `terraform destroy` はClaude Codeからは実行しない。** plan結果の確認までに留め、適用は必ずユーザー自身が手動で行う
- 秘密情報はコードや設定ファイルに直書きしない（`.env` / AWS Secrets Manager・SSM Parameter Store経由）
- 破壊的操作（DBデータ削除、`docker compose down -v`、`migrate:fresh`、`terraform apply`/`destroy`、`git push --force`、`git reset --hard`）は必ず実行前にユーザーに確認する

詳細は [`CLAUDE.md`](./CLAUDE.md) を参照してください。

---

# Claude Code Base Configuration

This repository is a **base set of files** for starting implementation with [Claude Code](https://claude.com/claude-code). `CLAUDE.md` and `.claude/` (agents / commands / skills / rules / hooks) bundle together the configuration that lets Claude Code work safely and consistently.

As it stands, it's set up so a React.js (frontend) / Laravel (backend API) / MySQL (DB) app can be operated with Docker locally and AWS (managed via Terraform) in production (detailed usage isn't covered here — see the contents of each file).

## Contents

| Location | Role |
|---|---|
| `CLAUDE.md` | Project overview and baseline instructions for Claude Code |
| `.claude/agents/` | Role-specific subagent definitions |
| `.claude/commands/` | Slash commands invoked with `$ARGUMENTS` |
| `.claude/skills/` | Argument-less standard operations (start/stop/init, etc.) |
| `.claude/rules/` | Conventions auto-applied based on target paths |
| `.claude/hooks/` | Safety guards that mechanically block dangerous operations |
| `.claude/settings.json` | Hook activation settings |
| `english/` | English translations of `CLAUDE.md` / `.claude/` |

The currently registered agents/commands/skills/rules/hooks are as follows (covering React/Laravel/MySQL/Docker/Terraform(AWS)/git).

- **agents**: `frontend-dev`, `backend-dev`, `docker-infra`, `terraform-dev`, `code-reviewer`
- **commands**: `frontend-new/edit/fix/test`, `backend-new/edit/fix/test`, `git-commit`, `git-pr`, `terraform-new/edit/fix`
- **skills**: `setup-project`, `git-init`, `docker-up`, `docker-down`, `db-reset`, `terraform-plan`
- **rules**: `frontend.md`, `backend.md`, `database.md`, `docker.md`, `git.md`, `terraform.md`
- **hooks**: `protect-files.sh` (blocks edits to secrets/state files, etc.), `block-dangerous-commands.sh` (blocks `terraform apply/destroy`, `git push --force`, `git reset --hard`), `format-file.sh` (auto-formats files on save)

For the detailed content and usage of each file, refer directly to the file itself and to `CLAUDE.md`.

## Basic Principles

- **Claude Code must never run `terraform apply` / `terraform destroy`.** Stop at reviewing the plan output; the user must always apply it manually.
- Never hardcode secrets in code or config files (use `.env` / AWS Secrets Manager or SSM Parameter Store instead).
- Always confirm with the user before destructive operations (deleting DB data, `docker compose down -v`, `migrate:fresh`, `terraform apply`/`destroy`, `git push --force`, `git reset --hard`).

See [`CLAUDE.md`](./CLAUDE.md) for details.
