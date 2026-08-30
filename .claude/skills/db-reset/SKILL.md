---
name: db-reset
description: ローカルMySQLのデータを初期化し、マイグレーション＋Seederを再適用する
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

破壊的操作なので、実行前に必ずユーザーに「ローカルDBのデータを全て削除して作り直します。よろしいですか」と確認する。

確認が取れたら、まず軽量な方法を優先する:

1. `docker compose exec backend php artisan migrate:fresh --seed` を実行する（テーブルを全て削除して再作成し、Seederを流す）。

これでうまくいかない場合（コンテナ自体の再作成が必要な場合）のみ:

2. `docker compose stop db`
3. `docker compose rm -f db`
4. `docker volume ls` でDB用の名前付きボリュームを確認し、`docker volume rm` で削除する
5. `docker compose up -d db` でDBコンテナを再作成する
6. `docker compose exec backend php artisan migrate --seed` を実行する
