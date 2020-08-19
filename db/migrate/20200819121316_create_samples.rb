class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.string :基本コード, null: false
      t.string :サブコード, null: false
      t.string :個別番号, null: false
      t.string :申込番号, null: false
      t.string :販売商品名, null: false
      t.string :カテゴリー, null: false
      t.string :カラー
      t.string :ロケーション, null: false
      t.timestamps
    end
  end
end
