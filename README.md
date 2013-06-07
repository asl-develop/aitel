# aitel

# ワークフロー

リポジトリを共有してのpull request開発です。

## リポジトリ取得

```bash
$ git clone http://github.com/asl-develop/aitel.git

```

## リモートに追加
```bash
$ git remote add origin http://github.com/asl-develop/aitel.git
```

## 修正の度に行う


### 修正の前
* トピックブランチを切る

```bash
$ git checkout -b topic-test-pass origin/master
```

### 修正後

* ソース修正してコミットする

```bash
$ git add .
$ git commit -m '本当はadd .じゃなくて git statusとか見て確認してね'
```

### 本流の修正を内側でマージ(一応動作確認したい)
* 本流の変更を取得
```bash
$ git fetch origin
```
* 本流にあって自分のリポジトリに無いコミットを確認
```bash
$ git log --no-merges ^HEAD origin/master
```
* 変更があるので自分のリポジトリにリベース
```bash
$ git rebase origin/master
```

* 動作に問題がなければ自分のリモートのトピックブランチにプッシュ
```bash
$ git push origin topic-test-pass
```
### Pull Request

* Github上の自分のリポジトリを開く(https://github.com/asl-develop/aitel.git)

* 左上のプルダウンメニューから`topic-test-pass`ブランチを選択する

* 「Pull Request」ボタンをクリックして本流のmasterブランチにPull Requestを送る

### マージ

* Github上の本流のリポジトリを開く(https://github.com/asl-develop/aitel.git)

* [Pull Requests]をクリックして当該Pull Requestを開く

* みんなからのつっこみを待つ、みんなから`merge it!`をもらえたら[Merge pull request]をクリックする
