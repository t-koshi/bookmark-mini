# 環境構築
## 開発環境について

開発環境はDockerによるコンテナ環境となります。

### 開発環境構成

コンテナ名  | ドメイン         | IP       | ポートマッピング            | 説明
------ | ------------------ | --------- | ------------------- | ----------------
web    | localhost   | 127.0.0.1 | HTTP(3000) | web(rails)
mailcather    | localhost   | 127.0.0.1 | HTTP(1080) | メール受信用

## Docker
1. Dockerのインストール

  ```
  Dockerのインストール(mac用)
  https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac
  ```

2. docker composeのインストール

  ```
  https://docs.docker.com/compose/install/
  ```
## バックエンド
### アプリ初期設定
#### 環境変数の作成
```
cp .env.example .env

```
#### サーバ構築、 bundle install、 DB 作成、テストデータの作成
```
$ make init
```

### 起動コマンド

以下のコマンドで起動します。

```
$ make up
```

### 停止コマンド

以下のコマンドで停止します。

```
$ make up
```

# ER図
![ER図](https://github.com/t-koshi/bookmark-mini/blob/master/er/erdiagram.png?raw=true)
