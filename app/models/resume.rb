class Resume < ApplicationRecord
  #現状、正確にはアソシエーションでは無いので、設定なし
  #設定すると保存出来ない（解決方法不明）
  # belongs_to :sample  # samplesテーブルとのアソシエーション
  # belongs_to :user  # usersテーブルとのアソシエーション

  #テスト中
  validates :ロケーション新, presence: true
end
