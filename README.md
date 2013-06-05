# aitel

## 始め方

### リポジトリ取得

```bash
$ git clone git@github.com:miss-matching/sample-blog-app.git

### ルーテイングでまよったら

```bash
$ bundle exec rake routes
```

### 本流のリポジトリの変更を自分のリポジトリに適用

```bash
# 以下は最初だけ
# 本流のリポジトリをリモートに追加
$ git remote add upstream git@github.com:miss-matching/sample-blog-app.git

# 以降は毎回
# 本流の変更をフェッチ
$ git fetch upstream

# 本流にあって自分のリポジトリにないコミットを確認
$ git log --no-merges ^HEAD upstream/master
commit bb77b08e041175559be9639db6ecb5af05f7ccb7
Author: Tajima Junpei <p.baleine@gmail.com>
Date:   Thu May 2 08:51:29 2013 +0900

    add `vendor/bundle` to gitignore

# 本流に変更があったのでこれを自分のリポジトリにリベース
$ git rebase upstream/master
```

## Workflow

以下の作業は最初だけ行う

### miss-matching/sample-blog-appを自分のアカウント用にフォークする

* Github上のリポジトリをブラウザで開く(https://github.com/miss-matching/sample-blog-app)

* 右上の「Fork」クリックして自分のアカウントを選択する、Github上にACCOUNT_NAME/sample-blog-appリポジトリができる

* ローカルにACCOUNT_NAME/sample-blog-appリポジトリをクローンする

```bash
$ git clone git@github.com:p-baleine/sample-blog-app.git
```

以下の作業は毎回行う、以下はissueベースの例

### Pull Request

* 本流に追従している状態でトピックブランチを切る

```bash
$ git checkout -b topic-test-pass origin/master
```

* ソース修正してコミット、プッシュする

```bash
# ソース修正後
$ git add .
# コミット
# コミットメッセージに`closes #<issue number>`を含めるとgithub上のissueを勝手にクローズしてくれる
$ git commit -m "functionalテストを通す, closes #2"
# 自分のリモートのトピックブランチにプッシュ
$ git push origin topic-test-pass
```

* Github上の自分のリポジトリを開く(https://github.com/ACCOUNT_NAME/sample-blog-app)

* 左上のプルダウンメニューから`topic-test-pass`ブランチを選択する

* 「Pull Request」ボタンをクリックして本流のmasterブランチにPull Requestを送る

### マージ

* Github上の本流のリポジトリを開く(https://github.com/miss-matching/sample-blog-app)

* [Pull Requests]をクリックして当該Pull Requestを開く

* みんなからのつっこみを待つ、みんなから`merge it!`をもらえたら[Merge pull request]をクリックする
