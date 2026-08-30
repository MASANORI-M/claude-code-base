---
name: docker-down
description: Docker Composeで開発環境を停止する（データ削除はしない）
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

1. `docker compose down` を実行する（ボリュームは残す = DBデータは消えない）。
2. `-v` オプション（ボリュームごと削除）が必要な場合は、必ず先にユーザーへ「MySQLのデータが全て消えますが実行してよいですか」と確認してから実行する。無断で `-v` を付けない。
