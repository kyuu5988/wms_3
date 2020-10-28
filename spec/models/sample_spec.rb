require 'rails_helper'
describe Sample, type: :model do
  before do
    @sample = FactoryBot.build(:sample)
  end

  describe 'サンプル登録する時の確認' do
    context '登録が正常に出来る場合' do
      it "全カラムに対して指定の入力であれば登録OK" do
        expect(@sample).to be_valid
      end
    end

    context '登録が異常な場合' do
      it "基本コードが無いと登録NG" do
        @sample.基本コード = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("基本コード 10桁ありません")
      end       
      it "サブコードが無いと登録NG" do
        @sample.サブコード = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("サブコード 3桁ありません")
      end       
      it "個別番号が無いと登録NG" do
        @sample.個別番号 = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("個別番号 入力必須")
      end       
      it "申込番号が無いと登録NG" do
        @sample.申込番号 = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("申込番号 6桁ありません")
      end       
      it "販売商品名が無いと登録NG" do
        @sample.販売商品名 = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("販売商品名 が入力されていません。")
      end       
      it "カテゴリーが無いと登録NG" do
        @sample.カテゴリー = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("カテゴリー 2桁ありません")
      end       
      it "ロケーションが無いと登録NG" do
        @sample.ロケーション = ''
        @sample.valid?
        expect(@sample.errors.full_messages).to include("ロケーション が入力されていません。")
      end       

    end
  end
end
