class Resume < ApplicationRecord
  #現状、正確にはアソシエーションでは無いので、設定なし
  #設定すると保存出来ない（解決方法不明）
  # belongs_to :sample  # samplesテーブルとのアソシエーション
  # belongs_to :user  # usersテーブルとのアソシエーション

  #バリデーションの設定は不要。必要な値を取得して必要なカラムに保存する設定（コントローラーで）  
end
