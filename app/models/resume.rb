class Resume < ApplicationRecord
  belongs_to :sample  # samplesテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
