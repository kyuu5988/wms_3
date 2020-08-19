class SamplesController < ApplicationController

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    if @sample.save
      #redirect_to root_path
      redirect_to new_sample_path, notice: '作成完了・続けて作成可'
    else
      render :new
      
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
