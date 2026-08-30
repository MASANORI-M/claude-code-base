---
name: setup-project
description: Docker上で動くReact + Laravel + MySQLの開発環境を最初から構築する（React/Laravelのインストールから）
disable-model-invocation: true
allowed-tools: Bash(docker *), Bash(npx *), Bash(composer *), Bash(mkdir *), Bash(cp *), Bash(chmod *)
---

このプロジェクトのDocker開発環境を、React・Laravelのインストールから一括で構築する。
対象: フロントエンド(React.js) / バックエンド(Laravel API) / DB(MySQL) / 管理(GitHub) / ローカルDocker専用（クラウドデプロイなし）。

## 手順

1. **既存ファイルの確認**
   `frontend/`, `backend/`, `docker-compose.yml` が既に存在するか確認する。存在する場合は上書きせず、ユーザーに方針を確認する。

2. **ディレクトリ構成の作成**
   ```
   .
   ├── frontend/       # React
   ├── backend/        # Laravel
   ├── docker-compose.yml
   ├── .env.example
   ├── .gitignore
   └── README.md
   ```

3. **React (frontend) のセットアップ**
   - `npx create-react-app frontend`（もしくはユーザーに Vite との選択を確認してから実行）
   - `frontend/.env.example` を作成し、`REACT_APP_API_BASE_URL=http://localhost:8000` を記載
   - `frontend/Dockerfile`（開発用: node イメージ + `npm start`、ボリュームマウント前提でホットリロード可能にする）を作成

4. **Laravel (backend) のセットアップ**
   - `composer create-project laravel/laravel backend` でLaravelプロジェクトを作成する（composerがローカルに無ければ、一時的なComposerコンテナ経由で実行する）
   - `backend/.env.example` を作成し、DB接続情報は環境変数参照にする（`DB_HOST=db`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` 等）。`APP_KEY` は空にしておき、初回起動時に `php artisan key:generate` する
   - `backend/Dockerfile`（PHP-FPMベース、必要な拡張（pdo_mysql等）を有効化、開発用に`php artisan serve`または通常のPHP-FPM+ホットリロード対応のボリュームマウント構成）を作成
   - Webサーバー構成（nginxを別コンテナにするか、`php artisan serve`で簡略化するか）をユーザーに確認してから決定する

5. **MySQL / docker-compose.yml の作成**
   - `db` サービス: `mysql:8` イメージ、名前付きボリューム、環境変数は `.env` 参照
   - `backend` サービス: `depends_on: db`、ポート `8000:8000`（または nginx 経由の場合は該当ポート）
   - `frontend` サービス: `depends_on: backend`、ポート `3000:3000`
   - 開発体験を優先し、`frontend`/`backend` はソースディレクトリをボリュームマウントしてホットリロードできるようにする

6. **.env.example / .gitignore の整備**
   - ルートまたは各ディレクトリの `.env.example` に `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, `DB_ROOT_PASSWORD` を記載（値はダミー）
   - `.gitignore` に `.env`, `node_modules/`, `backend/vendor/`, MySQLのデータディレクトリ相当を追加

7. **README.md に起動手順を記載**
   - `.env` の準備 → `/docker-up` → 初回のみ `backend` コンテナ内で `php artisan key:generate` と `php artisan migrate` を実行する旨を書く

8. **最後に `/docker-up` を実行して起動確認**し、3サービスが起動し、`http://localhost:3000` からフロントエンドが `http://localhost:8000` のAPIを叩けることを確認する。

失敗した場合はログ(`docker compose logs`)を読み、原因を切り分けてから修正する。不明な選択（React vs Vite、nginx有無、PHPのバージョン等)がある場合は、進める前に一度ユーザーに確認する。
