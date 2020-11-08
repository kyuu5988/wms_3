class Sample < ApplicationRecord
  has_many :resumes
  has_many :air_times

  def self.search(search)
    if search.to_s =~ /^[0-9]+$/
      Sample.where('申込番号 LIKE(?)',"%#{search}%")
    else
      Sample.where('販売商品名 LIKE(?)',"%#{search}%")
    end
  end

  #ロケーション内検索用
  def self.search2(search)
    Sample.where('ロケーション LIKE(?)',"%#{search}%")
  end


  with_options length:{ minimum: 10, message:'10桁ありません' }, format: { with: /\A\d{10}/,message: '半角数字のみ登録可' } do
    validates :基本コード
  end

  validates :サブコード, length:{ minimum: 3, message:'3桁ありません' }, format: { with: /\A\d{3}/, message: '半角数字のみ登録可' }

  validates :個別番号, length:{ minimum: 1, message:'入力必須' }, format: { with: /\A\d{1}/, message: '半角数字のみ登録可' }

  validates :申込番号, length:{ minimum: 6, message:'6桁ありません' }, format: { with: /\A\d{6}/, message: '半角数字のみ登録可' }

  validates :販売商品名, :ロケーション, presence: true

  validates :カテゴリー, length:{ minimum: 2, message:'2桁ありません' }, format: { with: /\A\d{2}/, message: '半角数字のみ登録可' }


end
