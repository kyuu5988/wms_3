class SamplesController < ApplicationController

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    if @sample.save
      #redirect_to root_path
      redirect_to new_sample_path, notice: '登録完了・続けて登録可能'
    else
      #render :new
      redirect_to new_sample_path, notice: '入力に誤りがあります'

    end
  end

  def search
    @samples = Sample.search(params[:keyword])
  end

#ここから独自アクション（自動ロケーション更新機能）

  #同品番、同時変更
  def auto_move_all

    @sample = Sample.find(params[:sample_id]) 
    #3000/samples/id/auto_move_allでレコード指定

    no = @sample[:申込番号] #[]を使ってカラムを指定 

    arr = [] #動作確認用
    @products = Sample.where(申込番号: no) #指定条件で複数取得
    @products.update(ロケーション: "720906")
    #↑利用時はコメントアウト外す（これで指定カラムの値変更）
    arr << @products[1][:ロケーション] #確認用
    #取得したレコードのn番目の指定カラム
    render plain: arr
    #render :done #確認用

  end

  def done
    
  end




  private

  def sample_params
    params.require(:sample).permit(:基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :カラー, :ロケーション)
  end



end
