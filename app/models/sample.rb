class Sample < ApplicationRecord

  def self.search(search)
    if search
      Sample.where('基本コード LIKE(?)',"%#{search}%")
    else 
      #Sample.all
         
    end
  end


  validates :基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :ロケーション, presence: true



end
