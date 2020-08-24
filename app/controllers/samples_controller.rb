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

  #同品番、同時変更 A-ST
  def auto_move_ast

    @sample = Sample.find(params[:sample_id]) 
    #3000/samples/id/auto_move_astでレコード指定

    no = @sample[:申込番号] #[]を使ってカラムを指定 

    #arr = [] #動作確認用
    @products = Sample.where(申込番号: no) #指定条件で複数取得
    if @products[0][:ロケーション] == "A-STUDIO"
      @products.update(ロケーション: "INV-4F")
      #↑利用時はコメントアウト外す（これで指定カラムの値変更）
      #arr << @products[0][:ロケーション] #確認用
      #取得したレコードのn番目の指定カラム
      #render plain: arr #確認用
      render :done_move

    elsif @products[0][:ロケーション] != "A-STUDIO"   
      @products.update(ロケーション: "A-STUDIO")
      render :done_move


    else
      #redirect_to root_path
      text = "移動エラーです。南に聞いてください"
      render plain: text
    end

  end

  #同時移動 C-ST
  def auto_move_cst

    @sample = Sample.find(params[:sample_id]) 
    #3000/samples/id/auto_move_cstでレコード指定

    no = @sample[:申込番号] #[]を使ってカラムを指定 

    #arr = [] #動作確認用
    @products = Sample.where(申込番号: no) #指定条件で複数取得
    if @products[0][:ロケーション] == "C-STUDIO"
      @products.update(ロケーション: "INV-4F")
      #↑利用時はコメントアウト外す（これで指定カラムの値変更）
      #arr << @products[0][:ロケーション] #確認用
      #取得したレコードのn番目の指定カラム
      #render plain: arr #確認用
      render :done_move

    elsif @products[0][:ロケーション] != "C-STUDIO"   
      @products.update(ロケーション: "C-STUDIO")
      render :done_move


    else
      #redirect_to root_path
      text = "移動エラーです。南に聞いてください"
      render plain: text
    end

  end


  #単品移動 style-list
  def auto_move_one_sty
    @sample = Sample.find(params[:sample_id]) 
    if @sample[:ロケーション] != "style-list"
      @sample.update(ロケーション: "style-list")

      #render plain: @sample[:ロケーション]
      render :done_move_one

    elsif @sample[:ロケーション] == "style-list"
      render :done_move_one
      #redirect_to root_path
    end

  end


  #移動結果表示
  def done_move
    @sample = Sample.find(params[:sample_id]) 
    #(idはすでに渡されている)

    no = @sample[:申込番号] #[]を使ってカラムを指定 

    @products = Sample.where(申込番号: no) #指定条件で複数取得

  end

  #単品移動結果表示
  def done_move_one
      @sample = Sample.find(params[:sample_id]) 
      #(idはすでに渡されている)
  end



  private

  def sample_params
    params.require(:sample).permit(:基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :カラー, :ロケーション)
  end



end
