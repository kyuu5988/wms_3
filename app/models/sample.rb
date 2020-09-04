class Sample < ApplicationRecord

  def self.search(search)
    if search.to_s =~ /^[0-9]+$/
      Sample.where('申込番号 LIKE(?)',"%#{search}%")
    else
      Sample.where('販売商品名 LIKE(?)',"%#{search}%")

    end
  end


  with_options length:{ minimum: 10, message:'10桁ありません' }, format: { with: /\A\d{10}/,message: '半角数字のみ登録可' } do
    validates :基本コード
  end

  validates :サブコード, length:{ minimum: 3, message:'3桁ありません' }, format: { with: /\A\d{3}/, message: '半角数字のみ登録可' }


  validates :個別番号, :申込番号, :販売商品名, :カテゴリー, :ロケーション, presence: true



end
