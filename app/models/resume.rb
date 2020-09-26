class Resume < ApplicationRecord
  belongs_to :sample  # samplesテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  #テスト中
  validates :ロケーション新, presence: true
end
