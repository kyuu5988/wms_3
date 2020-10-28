require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'アカウント登録する時の確認' do
    context '登録が正常に出来る場合' do
      it "全カラムに対して指定の入力であれば登録OK" do
        expect(@user).to be_valid
      end
      it "nicknameが日本語で登録OK" do
        @user.name = "にっくねーむ" 
        expect(@user).to be_valid
      end
      it "passwordが8文字以上の英数で登録OK" do
         @user.password = "1234abcd"
         @user.password_confirmation = "1234abcd"
         expect(@user).to be_valid
      end
    end

    context '新規登録が異常な場合' do
      it "nameが無いと登録NG" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name が入力されていません。")
      end       
      it "emailが無いと登録NG" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email が入力されていません。")
      end    
      it "同じemailは登録NG" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email が既に登録されています。")
      end
      it "emailに@が無いと登録NG" do
        @user.email = "sample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email は有効でありません。")
      end
      it "passwordが無いと登録NG" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password が入力されていません。")
      end
      it "passwordが7文字以下は登録NG" do
        @user.password = "123abcd"
        @user.password_confirmation = "123abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は8文字以上に設定して下さい。")
      end
      it "password_confirmationが無いと登録NG" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation 再入力のパスワードと一致していません。")
      end

    end
  end
end
