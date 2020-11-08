# アプリ名
### wms_3 (商品サンプル管理アプリ)

# アプリ概要
### QR code / NFCタグ を利用した商品サンプル管理アプリ
### アプリ概要は heroku URL よりご覧ください。専用説明メニューあり。

# heroku URL
### https://wms3-hideo.herokuapp.com

## Basic 認証
### ユーザー名 : kyuu5988
### password   : hideo

# 利用方法 / 課題解決
### heroku URL から入ると、PC版には専用の利用説明メニューが表示されます。

# 紹介動画
### 近日 YouTube で公開

# git clone
### クローンして頂くことは可能ですが、あまりおすすめしません。このアプリは事前に予めDBがあり、それを管理するためのアプリです。すでにDBを用意してあるheroku上での体験がおすすめです。
### 用意してあるDBは企業内で使用する規則性のある決まったデータですので、ご自身で作るのは難しいと思います。
### 私が実際に目の前で実演を兼ねてご紹介することも可能です。（関東近県限定）ご連絡下さい。kyuu5988@yahoo.co.jp

# テーブル設計
### ER図は er.dio 内にあります。
### 設計に色々問題あるのは承知です。これは私が学習し始めて1ヶ月程度の時の知識のみで作りました。あえて、当時のままの状態で修正をしていません。

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| group     | string |             |
| mode      | string |             |

## samples テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| 基本コード  | string     | null: false                    |
| サブコード  | string     | null: false                    |
| 個別番号    | string     | null: false                    |
| 申込番号    | string     | null: false                    |
| 販売商品名  | string     | null: false                    |
| カテゴリー  | string     | null: false                    |
| カラー      | string     |                                |
| ロケーション| string     | null: false                    |
| rent        | string     | null: false                    |

### Association

- has_many :resumes
- has_many :air_times

## air_times テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| sample_id | integer    |                                |
| date      | date       |                                |
| start_t   | time       |                                |
| end_t     | time       |                                |
| onair_t   | time       |                                |
| sort_t    | integer    |                                |


## resumes テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    |                                |
| sample_id      | integer    |                                |
| ロケーション旧 | string     |                                |
| ロケーション新 | string     |                                |
| name           | string     |                                |
| group          | string     |                                |


