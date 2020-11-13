# app

## Project setup

- 担当者から master.key をもらっておく
- master.key を配置したらコンテナをビルド

```
docker-compose budil
```

### rails のセットアップ

- package.json にセットアップスクリプトまとめています。

```
yarn setup:rails
```

### 起動

```
docker-compose up -d
```

### Rails の動作確認

```
curl localhost:3000
```

### vue の動作確認

```
ブラウザでlocalhost:8080
```
