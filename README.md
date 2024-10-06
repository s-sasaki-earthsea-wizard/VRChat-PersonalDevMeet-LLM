# VRChat-PersonalDevMeet-LLM
プロジェクト名を書いてください。

## 概要
VRChatのイベント「個人開発集会」でのLTスライドを`fusuma`

## 開発環境
- OS: Ubuntu-18.04
  - 筆者の環境ですが、Dockerを使えるのならば他のOSでも動くと期待しています
- Docker: version 24.0.2

## 推奨ツール

- VSCode:
  - Markdown All in One: Markdownの補完・プレビューを提供
  - Marp for VS Code: スライドのプレビューと作成をサポート
  - Live Server: リアルタイムでスライドをプレビュー
  - Prettier - Code formatter: コードやMarkdownを自動整形
  - YAML: YAMLファイルの編集をサポート
  - Path Intellisense: ファイルパスの補完

## インストール方法
インストール方法を書いてください。
以下のようなコマンドを書くなどすると手順がわかりやすくなるでしょう。

```
make install
```

## 使い方
実行方法やチュートリアルを書いてください。
必要に応じてスクリーンショットや動画を使ってください。

## プロジェクトのサマリー生成スクリプト
このプロジェクトでは、[Olemi-llm-apprenticeさん](https://github.com/Olemi-llm-apprentice)によって提供されている、プロジェクトのサマリーを生成するスクリプトを使用しています。このスクリプトはMITライセンスの下で提供されており、開発のワークフローに組み込んでいます。

ただし、このスクリプトを実行して得られる`txt`ファイルは `.gitignore` によってバージョン管理から除外されており、リポジトリには含まれていません。スクリプトの元のソースコードやドキュメントについては[こちら](https://github.com/Olemi-llm-apprentice/generate-project-summary)をご覧ください。

## その他
必要なことがあれば書いてください。

