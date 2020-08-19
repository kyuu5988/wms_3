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

  private

  def sample_params
    params.require(:sample).permit(:基本コード, :サブコード, :個別番号, :申込番号, :販売商品名, :カテゴリー, :カラー, :ロケーション)
  end



end
