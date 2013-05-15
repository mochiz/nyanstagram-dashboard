Nyanstagram for iOSアプリ用のダッシュボードです。
[Dashing](http://shopify.github.com/dashing) フレームワークで構築しています。

必要なもの
----
* Heroku Toolbelt (https://toolbelt.heroku.com/)
* Ruby 2.0.0
* Google Analyticsのアカウント
* Nendのアカウント

環境変数の設定
----
Google Analytics, Nend情報取得用環境変数を`.env`に設定してください。

### 開発環境

```
$ cp .sample.env .env
$ vi .env

# Google Analytics
GA_USERNAME=example@qnyp.com
GA_PASSWORD=enter-your-passward
GA_UA_CODE=UA-********-1

# Nend
NEND_MAIL=example@qnyp.com
NEND_PASSWORD=enter-your-passward
```

### Heroku

Google Analytics
```
$ heroku config:add \
  GA_USERNAME=foo@example.com \
  GA_PASSWORD=enter-your-passward \
  GA_UA_CODE=UA-********-1
```

Nend
```
$ heroku config:add \
  NEND_MAIL=foo@example.com \
  NEND_PASSWORD=enter-your-passward
```

開発環境で確認
----
`foreman`を利用して起動します。

```
$ foreman start
```

[http://localhost:3030](http://localhost:3030)にアクセスするとダッシュボードが表示されます。

デプロイ
----

```
$ git push heroku master
```
